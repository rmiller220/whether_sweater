Rails.application.routes.draw do

  namespace :api do
    namespace :v0 do
      resources :forecast, only: [:index]
      post :users, to: 'users#create'
      post :sessions, to: 'sessions#login'
      post :road_trip, to: 'roadtrip#create'
      get '/book-search', to: 'book_search#index'
    end
  end
end
