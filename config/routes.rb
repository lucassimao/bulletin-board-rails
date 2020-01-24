Rails.application.routes.draw do
  root "home#index"
  
  get 'signup', to: 'organizations#new'
  resources :organizations

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
