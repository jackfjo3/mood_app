Rails.application.routes.draw do
  
  devise_for :users
  resources :moods

  root 'moods#index'

end
