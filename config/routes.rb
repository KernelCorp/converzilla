Converzilla::Application.routes.draw do
  devise_for :user, class_name: "User::Base"
  devise_for :client
  resources :inquires
  resources :operators
  resource :users, only: :show
end
