Converzilla::Application.routes.draw do
  get 'catching' => 'catching#show'
  root to: 'landing#index'
  devise_for :user, class_name: "User::Base"
  devise_for :client
  resources :inquires
  resources :visitors
  resources :visits, only: :create
  resources :operators
  resource :users, only: :show
  resource :js_script, only: :show
end
