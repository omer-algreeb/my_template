# == Schema Information
#
# Table name: species
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Specie < ApplicationRecord

  include SpeciePresenter

  belongs_to :category
end
