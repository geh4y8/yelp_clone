Rails.application.routes.draw do
  get 'sessions/new'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  root :to => 'sessions#new'
  resources :users
  resources :sessions
  resources :categories
  resources :restaurants do
    resources :reviews
  end

end
