Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'create-app', to: 'pages#create_app'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
