# == Schema Information
#
# Table name: acconts
#
#  id              :bigint           not null, primary key
#  account_balance :float
#  account_number  :string
#  email           :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :bigint
#
# Indexes
#
#  index_acconts_on_user_id  (user_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Accont < ApplicationRecord
  include AccontPresenter

  belongs_to :user, inverse_of: :accont

end
