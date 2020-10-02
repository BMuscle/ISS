Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  resources :users, only: [:show], param: :nickname

  root 'users#show'
end
