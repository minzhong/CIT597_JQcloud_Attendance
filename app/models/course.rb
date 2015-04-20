# == Schema Information
#
# Table name: courses
#
#  id          :integer          not null, primary key
#  course_code :string
#  course_name :string
#  term        :string
#  year        :integer
#  note        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Course < ActiveRecord::Base
 belongs_to :user
 has_many :attendances
 has_and_belongs_to_many :students

 validates :course_code, :presence => true
 validates :course_name, :presence => true

 validates :term, :presence => true
 validates :term, format: { with: /Summer|Fall|Spring/i,message: "term can be one of Summer, Fall or Spring"}
 
 validates :year, :presence => true
 validates :year, format: { with: /\d{4}/,message: "year should have 4 digits" }
end

