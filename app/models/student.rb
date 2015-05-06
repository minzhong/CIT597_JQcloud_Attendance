# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  pennid     :string
#  email      :string
#  note       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base

   has_many :attendances, foreign_key: "student_id", dependent: :destroy
   has_and_belongs_to_many :courses, join_table: "courses_students"
   
   validates :first_name, :presence => true
   validates :last_name, :presence => true

   validates :email, :presence => true
   validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: "email id invalid" }
  
   validates :pennid, :presence => true
   validates :pennid, format: { with: /\d{8}/, message: "penn ID should be 8 digits" }
   
   require 'csv'
   def self.import(file, course_id)
     if (file != nil) then
       CSV.foreach(file.path, headers: true) do |row|
         student_hash = row.to_hash 
         # student_hash = {"first_name"=>"Kate", "last_name"=>"Standton", "pennid"=>"62833952", "email"=>"kstandton@gmail.com", "note"=>nil}
         student = Student.where("pennid = ?", student_hash["pennid"]) # Check if the students table already has this record
         if student.blank? then 
           @student = Student.create!(student_hash)
           # populate the join table
           @student.courses << Course.find(course_id) 
         else 
           student.first.update_attributes(student_hash)
           unless student.first.courses.include? Course.find(course_id)
             student.first.courses << Course.find(course_id)
           end
         end
       end
     end # end first if block
   end # end import method
   
end
