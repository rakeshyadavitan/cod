Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :seasons, only: :index do
    resources :episodes, only: :index
  end

  resources :movies, only: :index do
    get :movies_and_seasons, on: :collection
  end

  resources :users, only: :show

  resources :purchases, only: :create

end
