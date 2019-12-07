Rails.application.routes.draw do
  root 'classes#index'
  get 'classes/new', to: 'classes#new'
  get 'about', to: 'pages#about'
end
