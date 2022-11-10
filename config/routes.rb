Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events do
    get "finish", on: :member
    post "submit_scores"
    resources :players, only: [:create, :update]
  end

  resources :games, only: [:index, :show] do
    get "leaderboards", on: :collection
    get "leaderboard", on: :member
  end

  get "dashboard", to: "pages#dashboard"
end
