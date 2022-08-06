Rails.application.routes.draw do
  resources :devices
  devise_for :users

  resources :users, :except => [:create, :new]
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
