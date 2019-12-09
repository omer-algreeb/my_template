Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
    root 'homes#index'
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'authentication#authenticate'
      post 'signup', to: 'users#create'

      resources :users, except: [:new, :edit, :delete, :create]
    end
  end
end
