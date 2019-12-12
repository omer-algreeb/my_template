Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
    root 'access#index'
    get 'access/login'
    post 'access/attempt_login'
    get 'access/logout'
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'

      resources :users, except: [:new, :edit, :delete, :create]
    end
  end
end
