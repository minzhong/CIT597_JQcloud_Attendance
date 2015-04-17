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
 has_many :attendance
 has_and_belongs_to_many :course
end
