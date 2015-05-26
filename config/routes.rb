Rails.application.routes.draw do
  devise_for :users
  root 'moods#index'
  resources :moods
end
