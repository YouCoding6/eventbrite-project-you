Rails.application.routes.draw do
  
  devise_for :users
  
  root to: 'events#index'
  
  resources :users, only: [:show] do
    resources :avatars, only: [:create]
  end
  
  resources :events do
    resources :pictures, only: [:create]
  	resources :charges
    resources :attendances
  end
  namespace :admin do
    root to: 'base#index'
    resources :users, except: [:show]
    resources :events
  end  
end
