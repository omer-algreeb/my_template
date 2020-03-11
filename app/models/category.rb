# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ApplicationRecord
  include CategoryPresenter
  has_many :type_of_checks
  has_many :organizations, through: :type_of_checks
  has_many :species
end
