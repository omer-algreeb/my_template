# == Schema Information
#
# Table name: employees
#
#  id         :bigint           not null, primary key
#  add        :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Employee < ApplicationRecord
end
