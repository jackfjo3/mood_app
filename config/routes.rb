Rails.application.routes.draw do
  
  devise_for :users

  resources :moods do
    collection do
      get :all
    end
  end

  root  'moods#new'

end
