Rails.application.routes.draw do
  root 'users#index'
  resources :users
  resources :user_steps
end
