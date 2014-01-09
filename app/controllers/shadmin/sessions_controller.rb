module Shadmin
	class SessionsController < ::Devise::SessionsController
		layout 'shadmin/application'
		
		private
  	
	  	def after_sign_out_path_for(resource)
	  		new_admin_session_path
	  	end
	end
end