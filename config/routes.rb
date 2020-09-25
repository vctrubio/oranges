Rails.application.routes.draw do
  resources :tests
  resources :tickets
  resources :orders
  resources :clients  do 
    resources :orders
  end
  resources :employees
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
