Rails.application.routes.draw do
  devise_for :users
  root to: 'events#index'
  resources :users, only: [:show]
  resources :events do
  	resources :charges
    resources :attendances
  end  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
