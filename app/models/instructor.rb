# == Schema Information
#
# Table name: instructors
#
#  id         :integer          not null, primary key
#  user_name  :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Instructor < ActiveRecord::Base
end
