Shadmin::Engine.routes.draw do
	devise_for :admins, {
    class_name: 'Shadmin::Admin',
    module: :devise
  }
end
