Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'

      resources :users, except: [:new, :edit, :delete]
      resources :organizations, except: [:new, :edit, :delete]
    end
  end
end
