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
        # attendance_hash = {"event_tran_actual_datetime" => "3/24/15 12:21", "customer_number" => "11100125"}
        # attendance_date_time = ["3/24/15", "12:21"] 
        attendance_date_time = attendance_hash["Event Tran Actual DateTime"]
        attendance_date_time_array = attendance_hash["Event Tran Actual DateTime"].split(" ")
        # Note: convert the string date to date type before saving to db, samething with time
        attendance_date = Date.strptime(attendance_date_time_array[0], '%m/%d/%Y')  
        attendance_time = Time.strptime(attendance_date_time, '%m/%d/%Y %H:%M')
        puts "Attendance date is #{attendance_date}"
       
        puts "Attendance time is #{attendance_time}"
        
        # student_id can be found through attendance_pennid using find_by_id
        attendance_pennid = attendance_hash["Customer Number"]
        puts "Attendance pennid is #{attendance_pennid}"
        
        @student = Student.where("pennid = ?", attendance_pennid)
        
        @student_id = 0 # default value
        if @student.blank? then
           @student_id = nil # student is then not registered in this course
        else @student_id = @student.first.id
        end
           
        attendance = Attendance.where(id: attendance_hash["id"])
        
        if attendance.count == 1 then # meaning the attendance already exists in the Attendances table
          attendance.first.update_attributes(attendance_hash) # update the attendance record found
        else # otherwise create the attendance record
          if course_id != nil && @student_id != nil then 
             @attendance = Attendance.create!({att_date: attendance_date, att_time: attendance_time, note: "", course_id: course_id, student_id: @student_id})
          end
        end 
        
      end # end CSV.foreach
    end # end if (file != nil)
  end # end import method
  
  def self.calculate_attendances(student_id)
    counts = 0
    count_hash = Attendance.group(:student_id).count
    if count_hash.has_key?(student_id) then 
      counts = count_hash[student_id]
    end
    return counts
  end

end
