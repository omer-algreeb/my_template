module AccontPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :account_balance
      t.add :account_number
      t.add :email
    end

    api_accessible :index, extend: :base

    api_accessible :show do |t|
      t.add :account_balance
      t.add :account_number
      t.add :email
      t.add :user
    end
  end
end
