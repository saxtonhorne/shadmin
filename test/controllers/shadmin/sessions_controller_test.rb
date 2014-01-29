require 'test_helper'

module Shadmin
	class SessionsControllerTest < ActionController::TestCase
		def setup
			@admin = create(:admin)	
			@request.env["devise.mapping"] = Devise.mappings[:admin]
		end

		def test_render_shadmin_layout
			sign_out @admin
			get :new, use_route: :shadmin
			assert_response :success
			assert_template layout: 'shadmin/sessions'
		end

		def test_login_redirect_to_location
			sign_out @admin
			post :create, use_route: :shadmin, admin: { email: @admin.email, password: 'password123', password_confirmation: 'password123' }
			assert_redirected_to admin_root_path
			assert signed_in?
		end

		def test_logout_redirect_to_location
			sign_in @admin
			delete :destroy, use_route: :shadmin
			assert_redirected_to new_admin_session_path
		end
	end
end