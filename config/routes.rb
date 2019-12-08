Rails.application.routes.draw do
  resources :workouts
  root 'workouts#index'
  get 'workouts/new', to: 'workouts#new'
  get 'about', to: 'pages#about'

end
