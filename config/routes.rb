Converzilla::Application.routes.draw do
  root to: 'landing#index'
  devise_for :user, class_name: "User::Base"
  devise_for :client
  resources :inquires
  resources :visitors
  resources :operators
  resource :users, only: :show
  resource :js_script, only: :show
end
