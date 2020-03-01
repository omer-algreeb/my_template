class User < ApplicationRecord

  # Associations
  belongs_to :organization

  include UserPresenter

  # encrypt password
  has_secure_password
  extend Enumerize

  # Validations
  validates_presence_of :name, :email, :password_digest

  enumerize :status, :in => { active: 0, blocked: 1 }, scope: :shallow

end
