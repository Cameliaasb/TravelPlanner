Rails.application.routes.draw do
  devise_for :users

  root to: "campaigns#index"

  resources :campaigns, only: %i[index show create update destroy] do
    resources :tags, only: %i[create destroy]
    resources :campaigncomments, only: %i[create destroy]
  end


  resources :todos, only: %i[create destroy] do
    resources :comments, only: %i[create destroy]
  end
end
