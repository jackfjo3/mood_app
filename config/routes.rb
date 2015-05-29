Rails.application.routes.draw do
  
  devise_for :users
  resources :moods

  get   'moods/all'   =>    'moods#all'

  root  'moods#new'

end
