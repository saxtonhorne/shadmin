require 'test_helper'

module Shadmin
	class PasswordsControllerTest < ActionController::TestCase
		def setup
			@admin = create(:admin)	
			@request.env["devise.mapping"] = Devise.mappings[:admin]
		end

		def test_new_action_template_layout
			sign_out @admin
			get :new, use_route: :shadmin
			assert_response :success
			assert_template layout: 'shadmin/sessions'
			assert_template 'shadmin/passwords/new'
		end

		def test_edit_action_template_layout
			sign_in @admin
			get :edit, use_route: :shadmin
			# assert_response :success
			assert_template layout: 'shadmin/sessions'
			assert_template 'shadmin/passwords/edit'
		end
	end
end