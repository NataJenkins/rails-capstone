Rails.application.routes.draw do
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'log_out', to: 'sessions#destroy'
  resources :users, only: [:new, :create]
  resources :articles do 
    resources :votes, only: [:destroy, :create]
  end
  resources :categories
  root 'categories#index'
end
