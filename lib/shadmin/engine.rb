module Shadmin
  class Engine < ::Rails::Engine
    isolate_namespace Shadmin

    # Set Devise controllers to use Shadmin application layout
    config.to_prepare do
		  Devise::SessionsController.layout 'shadmin/sessions'
		  Devise::PasswordsController.layout 'shadmin/sessions'
		end
  end
end
