require 'test_helper'

module Shadmin
	class Admin::PostsControllerTest < ActionController::TestCase

		def setup
			@controller = ::Admin::PostsController.new
			@routes = ::Dummy::Application.routes
			@admin = create(:admin)
		end

		def test_controller_inherits_from_shadmin
			assert @controller.class < Shadmin::ApplicationController
		end

		def test_admin_posts_controller_index
			sign_in @admin
			get :index
			assert_response :success
			assert_select 'div', 'Admin: Posts Index Controller'
		end

		def test_admin_posts_controller_show
			sign_in @admin
			get :show, id: 4
			assert_response :success
			assert_select 'div', 'Admin: Posts Show Controller'
		end

		def test_admin_posts_controller_inherits_shadmin_authentication
			# binding.pry
			sign_out @admin
			get :index
			assert_redirected_to '/admin/login'
		end
	end
end