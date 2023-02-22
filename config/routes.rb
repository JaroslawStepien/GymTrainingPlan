Rails.application.routes.draw do
  resources :exercises
  resources :gym_plans
  devise_for :users
  root 'home#index'
  get 'home/about'
end
