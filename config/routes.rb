Shadmin::Application.routes.draw do

  root to: redirect('/admin')

  # Devise routes
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :admin do
    get 'admin/logout', to: 'devise/sessions#destroy', via: :delete
  end

  namespace :admin do
    resources :admin_users
    resources :dashboard, only: :index
  end

  get '/admin', to: 'admin/dashboard#index'
end
