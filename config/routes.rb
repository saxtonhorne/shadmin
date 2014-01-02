Shadmin::Application.routes.draw do
  devise_for :admins, path: 'admin', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  devise_scope :admin do
    get 'admin/logout', to: 'devise/sessions#destroy', via: :delete
  end

  # root to: 'admin#index'

  namespace :admin do
  end
end
