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
			assert_template layout: 'shadmin/application'
			assert_template 'admin/posts/index'
		end

		def test_admin_posts_controller_show
			sign_in @admin
			get :show, id: 4
			assert_response :success
			assert_template 'admin/posts/show'
		end

		def test_admin_posts_controller_inherits_shadmin_authentication
			sign_out @admin
			get :index
			assert_redirected_to '/admin/login'
		end
	end
end