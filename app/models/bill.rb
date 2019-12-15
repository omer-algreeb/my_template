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

  belongs_to :user, inverse_of: :bills
  validates_presence_of :title, :price, :date
  enumerize :type_bill, in: { deposit: 0, withdrawal: 1 }, scope: :shallow

  # Callbacks
  after_create :calcolat_account
  before_validation :chek_price, if: :check_type

  def calcolat_account
    if self.type_bill == 'deposit'
      user.accont.update(account_balance: self.user.accont.try(:account_balance).to_f + self.price)
    else
      user.accont.update(account_balance: self.user.accont.try(:account_balance).to_f - self.price)
    end
  end

  def check_type
    self.type_bill == 'withdrawal'
  end

  def chek_price
    if self.user.accont.try(:account_balance).to_f < self.price
      errors.add(:base, I18n.t('base.errors.not_valed'))
      throw(:abort)
    end
  end
end
