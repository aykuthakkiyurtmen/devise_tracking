Rails.application.routes.draw do
  #devise_for :devices, path: 'devices', controllers: { sessions: "devices/sessions"}
  devise_for :devices, controllers: {
    sessions: 'devices/sessions',
    passwords: 'devices/passwords',
  }
  resources :devices
  devise_for :users

  resources :users, :except => [:create, :new]
  root to: 'users#index'

end
