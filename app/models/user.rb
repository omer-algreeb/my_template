# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string
#  name            :string
#  password_digest :string
#  status          :integer          default("active")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint
#
# Indexes
#
#  index_users_on_organization_id  (organization_id)
#
# Foreign Keys
#
#  fk_rails_...  (organization_id => organizations.id)
#

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
