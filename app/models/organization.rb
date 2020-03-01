class Organization < ApplicationRecord

  include OrganizationPresenter

  has_many :users, dependent: :destroy

  # Validations
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :website, :address, :city, :country, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
end
