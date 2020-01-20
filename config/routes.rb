Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :seasons do
    resources :episodes
  end

  resources :movies do
    get :movies_and_seasons, on: :collection
  end

end
