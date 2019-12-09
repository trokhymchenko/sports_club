Rails.application.routes.draw do
  devise_for :users
  resources :workouts
  root 'workouts#index'
  get 'workouts/new', to: 'workouts#new'
  get 'about', to: 'pages#about'

end
