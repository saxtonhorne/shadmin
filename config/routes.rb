Shadmin::Engine.routes.draw do
	devise_for :admins, {
    class_name: 'Shadmin::Admin',
    module: :devise,
    path: '/',
   	path_names: { sign_in: 'login', sign_out: 'logout' }
  }

  root to: 'dashboard#index'

  resources :admin_users
end
