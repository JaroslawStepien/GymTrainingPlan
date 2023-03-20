Rails.application.routes.draw do
  resources :gym_plans do
    resources :exercises
  end
  devise_for :users
  root 'gym_plans#index'
  get 'home/about'
end
