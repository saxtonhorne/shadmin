Shadmin::Application.routes.draw do

  root to: redirect('/admin/admin_users')

  get '/admin', to: redirect('/admin/login')

  # Devise routes
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :admin do
    get 'admin/logout', to: 'devise/sessions#destroy', via: :delete
  end

  namespace :admin do
    resources :admin_users
  end
end
