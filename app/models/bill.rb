# == Schema Information
#
# Table name: bills
#
#  id          :bigint           not null, primary key
#  date        :date
#  description :text
#  price       :float
#  title       :string
#  type_bill   :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint
#
# Indexes
#
#  index_bills_on_user_id  (user_id)
#

class Bill < ApplicationRecord
  include BillPresenter
  extend Enumerize

  belongs_to :user
  validates_presence_of :title, :price, :date
  enumerize :type_bill, in: { deposit: 0, withdrawal: 1 }, scope: :shallow

  # Callbacks
  after_create :calcolat_account

  def calcolat_account
    if type_bill == 'deposit'
      user.accont.update(account_balance: user.accont.account_balance + price)
    else
      user.accont.update(account_balance: user.accont.account_balance - price)
    end
  end
end
