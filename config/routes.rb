Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  get '/home', to: 'home#index'

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :users, only: [:index]
      get '/users/current_user', to: 'users#current_user'
    end
  end

  root 'home#index'
end
