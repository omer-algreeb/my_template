module AccontPresenter
  extend ActiveSupport::Concern

  included do
    acts_as_api

    api_accessible :base do |t|
      
    end

    api_accessible :index, extend: :base

    api_accessible :show, extend: :base
  end
end