Rails.application.routes.draw do

  mount Shadmin::Engine => "/admin"

  namespace :admin do
  	resources :posts, only: [:index, :show]
  end

  resources :posts, only: [:index, :show]
end
