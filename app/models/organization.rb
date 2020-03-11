# == Schema Information
#
# Table name: organizations
#
#  id             :bigint           not null, primary key
#  address        :string           not null
#  address_ar     :string           not null
#  admin_email    :string
#  city           :string           not null
#  city_ar        :string           not null
#  contact_number :string
#  country        :string           not null
#  country_ar     :string           not null
#  is_enabled     :boolean          default(TRUE), not null
#  name           :string           not null
#  name_ar        :string           not null
#  slug           :string           not null
#  website        :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Organization < ApplicationRecord

  include OrganizationPresenter

  has_many :users, dependent: :destroy
  has_many :type_of_checks
  has_many :categories, through: :type_of_checks

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :website, :address, :city, :country, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
end
