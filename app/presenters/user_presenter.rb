module UserPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :id
      t.add :name
      t.add :email
      t.add :accont
      t.add :status_text
    end

    api_accessible :index, extend: :base

    api_accessible :show do |t|
      t.add :id
      t.add :name
      t.add :email
      t.add :status_text
    end
  end
end
