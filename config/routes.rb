Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  scope '/api' do
    scope '/v1' do
      resources :seasons, only: :index do
        resources :episodes, only: :index
      end

      resources :movies, only: :index do
        get :movies_and_seasons, on: :collection
      end

      resources :users, only: :show

      resources :purchases, only: :create
    end
  end

end
