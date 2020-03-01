module OrganizationPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      t.add :name
      t.add :city
      t.add :country
      t.add :name_ar
      t.add :city_ar
      t.add :address
      t.add :address_ar
      t.add :country_ar
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :base

  end
end
