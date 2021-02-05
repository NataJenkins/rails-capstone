Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  #get 'sign_up', to: 'users#new'
  resources :users, only: [:new, :create]
  resources :articles do 
    resources :votes, only: [:destroy, :create]
  end
  resources :categories
  root 'categories#index'
end
