Rails.application.routes.draw do
  devise_for :users

  root to: "campaigns#index"
  resources :campaigns, only: %i[index show create update destroy]
  resources :tags, only: :destroy
end
