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
 has_and_belongs_to_many :courses

  validates :first_name, :presence => true
  validates :last_name, :presence => true

  validates :email, :presence => true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i,message: "email id " }
  
  validates :pennid, :presence => true
  validates :pennid, format: { with: /\d{8}/,message: "penn ID should be 8 digits" }
end


