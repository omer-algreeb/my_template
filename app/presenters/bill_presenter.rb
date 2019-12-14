module BillPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :type_bill_text
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :base
  end
end