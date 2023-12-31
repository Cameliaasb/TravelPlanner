Rails.application.routes.draw do
  devise_for :users

  root to: "campaigns#index"

  resources :campaigns, only: %i[index show create update destroy] do
    resources :tags, only: %i[create destroy]
    resources :campaigncomments, only: %i[create destroy]
    resources :decisions, only: %i[create update destroy]
    resources :memberships, only: %i[create destroy]
  end


  resources :todos, only: %i[show new create update destroy] do
    resources :comments, only: %i[create destroy]
  end
end
