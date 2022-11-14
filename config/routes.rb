Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events do
    get "finish", on: :member
    post "submit_scores", on: :member
    resources :players, only: [:create, :update] do
      member do
        patch :accept
        patch :reject
      end
    end
    resources :messages, only: :create
  end

  resources :games, only: [:index, :show] do
    get "leaderboards", on: :collection
    get "leaderboard", on: :member
  end

  # resources :users, only: :show
  get 'users/:username', to: "users#show", as: "profile_page"

  get "dashboard", to: "pages#dashboard"
end
