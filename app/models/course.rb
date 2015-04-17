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
 has_many :attendance
 has_and_belongs_to_many :student
end
