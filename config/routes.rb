Rails.application.routes.draw do
  root "home#index"
  
  get 'signout', to: 'home#signout'
  get 'signup', to: 'organizations#new'
  get 'dashboard', to: 'organizations#index'
  resources :organizations, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
