Rails.application.routes.draw do
  get 'homes/index'
  resources :totals
  resources :payments
  resources :orders   do 
    member do 
      patch :paid
      patch :delivered
    end
    resources :receipts, only: [:create, :destroy]
    end
  resources :clients  do 
    resources :orders
  end
  resources :employees
  resources :landlords
  resources :pickups, only: [:create, :edit, :show, :index, :destroy, :new]
  resources :bags, only: [:create, :destroy, :new, :index, :edit]
  devise_for :users
  root to: 'homes#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
