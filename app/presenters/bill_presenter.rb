module BillPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :title
      t.add :price
      t.add :description
      t.add :type_bill_text
      t.add 'user.accont.account_balance', as: :account_balance
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :base
  end
end
