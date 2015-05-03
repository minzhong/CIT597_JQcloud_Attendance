# == Schema Information
#
# Table name: attendances
#
#  id         :integer          not null, primary key
#  att_date   :date
#  att_time   :time
#  note       :text
#  course_id  :integer
#  student_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Attendance < ActiveRecord::Base
  belongs_to :course
  belongs_to :student
                                    
  validates :att_date, :presence => true
  #validates :att_date, format: {with: /\d{2}\/\d{2}\/\d{4}/,message:"Date should be mm/dd/yyyy"}

  validates :att_time, :presence => true
  # validates :att_time, format: {with: /[0-2][0-9]:[0-5][0-9]/}

  validates :course_id, :presence => true

  validates :student_id, :presence => true
  # validates :student_id, format: { with: /\d{8}/, message: "penn ID should be 8 digits" }
  
  require 'csv'
  require 'date'
  require 'time'
  def self.import(file, course_id)
    if (file != nil) then
      CSV.foreach(file.path, headers: true) do |row|
        attendance_hash = row.to_hash       
        p attendance_hash
        # attendance_hash:
        # {"Event Tran Actual DateTime"=>"1/16/15 12:21", "Customer Number"=>"11100125", "Customer Name"=>"GREEN", "Profit Center Name"=>"EMILY", "POS Name"=>"Attendance", "Event Name"=>"AnnenbergAttend2", "Event Tran Type"=>"Attendance", "Entry Type"=>"Regular Entry"}
        # attendance_date_time = ["3/24/15", "12:21"] 
        attendance_date_time = attendance_hash["Event Tran Actual DateTime"]
        attendance_date_time_array = attendance_hash["Event Tran Actual DateTime"].split(" ")
        # Note: convert the string date to date type before saving to db, samething with time
        attendance_date = Date.strptime(attendance_date_time_array[0], '%m/%d/%Y')  
        attendance_time = Time.strptime(attendance_date_time, '%m/%d/%Y %H:%M')
        
        # student_id can be found through attendance_pennid using find_by_id
        attendance_pennid = attendance_hash["Customer Number"]
        
        @student = Student.where("pennid = ?", attendance_pennid)
        
        @student_id = 0 # default value
        if @student.blank? then
           @student_id = nil # student is then not registered in this course
        else @student_id = @student.first.id
        end
        # check if attendance records for this course already in db
        attendance = Attendance.where("student_id = ? AND course_id = ? AND att_date = ? AND att_time = ?", Student.find_by_pennid(attendance_hash["Customer Number"]).id, course_id, attendance_date, attendance_time)
        
        if attendance.blank? then # meaning the attendance not exists in the Attendances table
          @attendance = Attendance.create!({att_date: attendance_date, att_time: attendance_time, note: "", course_id: course_id, student_id: @student_id})
        else # otherwise create the attendance record
          attendance.first.update_attributes(att_date: attendance_date, att_time: attendance_time, note: "", course_id: course_id, student_id: @student_id) # update the attendance record found
        end 
        
      end # end CSV.foreach
    end # end if (file != nil)
  end # end import method
  
  def self.calculate_attendances(student_id, course_id)
    counts = Attendance.where("student_id = :studentid AND course_id = :courseid", {studentid: student_id, courseid: course_id}).count
    return counts
  end

end
