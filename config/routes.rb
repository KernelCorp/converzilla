Converzilla::Application.routes.draw do
  devise_for :user, class_name: "User::Base"
  devise_for :client, class_name: "User::Client"

  resources :inquires
  resources :operators, as: 'user_operator'
end
