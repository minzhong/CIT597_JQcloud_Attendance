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
                                    
  #validates :att_date, :presence => true
  #validates :att_date, format: {with: /\d{2}\/\d{2}\/\d{4}/,message:"Date should be mm/dd/yyyy"}

  validates :att_time, :presence => true
  validates :att_time, format: {with: /[0-2][0-9]:[0-5][0-9]/}

  validates :course_id, :presence => true

  validates :student_id, :presence => true
  validates :student_id, format: { with: /\d{8}/, message: "penn ID should be 8 digits" }
end
