module Shadmin
  class Engine < ::Rails::Engine
    isolate_namespace Shadmin

    # Set Devise controllers to use Shadmin application layout
    config.to_prepare do
		  Devise::SessionsController.layout 'shadmin/application'
		  Devise::PasswordsController.layout 'shadmin/application'
		end
  end
end
