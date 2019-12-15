# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  role            :integer          default(1)
#  status          :integer          default("active")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

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

  scope :onle_permission, -> (ids) { where(id: ids)}

  enumerize :status, in: { active: 0, blocked: 1 }, scope: :shallow

  enumerize :role, in: { admin: 0, default: 1 }, scope: :shallow

  def is_admin?
    self.role == 'admin'
  end
end
