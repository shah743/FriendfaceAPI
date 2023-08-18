Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :likes, only: [:create] do
    collection do
      get :most_likes
      get :streaks
    end
  end
end
