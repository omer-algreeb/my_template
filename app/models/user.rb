class User < ApplicationRecord

  include UserPresenter

  has_one_attached :avatar
  has_one :accont
  has_many :bills

  # encrypt password
  has_secure_password
  extend Enumerize

  # Validations
  validates_presence_of :name, :email, :password_digest

  enumerize :status, :in => { active: 0, blocked: 1 }, scope: :shallow

end
