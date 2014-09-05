Converzilla::Application.routes.draw do
  devise_for :user, class_name: "User::Base"

  resources :inquires
  resources :operators, as: 'user_operator'
end
