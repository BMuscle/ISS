Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  get '/home', to: 'home#index'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show]
    end
  end

  root 'home#index'
end
