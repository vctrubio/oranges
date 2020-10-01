Rails.application.routes.draw do
  resources :orders do 
    resources :receipts, only: [:create, :destroy,]
    end
  resources :clients  do 
    resources :orders
  end
  resources :employees
  devise_for :users
  root to: 'orders#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
