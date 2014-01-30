Shadmin::Engine.routes.draw do
	devise_for :admins, {
    class_name: 'Shadmin::Admin',
    module: :devise,
  	controllers: { sessions: 'shadmin/sessions', passwords: 'shadmin/passwords' },
    path: '/',
   	path_names: { sign_in: 'login', sign_out: 'logout' }
  }

  root to: 'dashboard#index', as: 'admin_root'

  resources :admin_users
end
