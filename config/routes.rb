Rails.application.routes.draw do
  
  devise_for :users
  resources :moods

  root 'moods#new'

end
