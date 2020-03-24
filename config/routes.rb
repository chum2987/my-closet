Rails.application.routes.draw do
  # get 'outfits/index'
  root to: "outfits#index"
  resources :outfits, only: :index
  resources :user
end
