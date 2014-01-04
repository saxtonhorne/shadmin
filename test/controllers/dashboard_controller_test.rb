require 'test_helper'

class Admin::DashboardControllerTest < ActionController::TestCase

	def setup
		@admin = admins :adam
	end

  # GET :index /admin
  def test_index_routing
		assert_routing '/admin/dashboard', { controller: 'admin/dashboard', action: 'index' }
  end

  def test_index
  	sign_in @admin
  	get :index
  	assert_response :success
  	assert_template layout: 'admin'
  	assert_template 'dashboard/index'
  end

  def test_redirect_non_logged_in_user_for_index
  	sign_out :admin
  	get :index
  	assert_redirected_to new_admin_session_path
  end

end
