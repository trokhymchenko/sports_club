Rails.application.routes.draw do
  devise_for :users

  resources :workouts do
    member do
      patch :complete
    end
  end
  resources :exercises do
    member do
      patch :complete
    end
  end
  resources :audits

  root 'workouts#index'
  get 'workouts/new', to: 'workouts#new'
  get 'about', to: 'pages#about'
    # post 'exercise', to: 'exercise#create'
end
