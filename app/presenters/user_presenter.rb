module UserPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :name
      t.add :email
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :base
  end
end
