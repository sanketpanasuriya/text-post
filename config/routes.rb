Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :tweets do
    get :my_tweets, on: :collection
  end

  root 'tweets#index'
end
