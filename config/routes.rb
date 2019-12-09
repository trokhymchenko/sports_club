Rails.application.routes.draw do
  devise_for :users
  resources :workouts do
    member do
      patch :complete
    end
  end
  root 'workouts#index'
  get 'workouts/new', to: 'workouts#new'
  get 'about', to: 'pages#about'

end
