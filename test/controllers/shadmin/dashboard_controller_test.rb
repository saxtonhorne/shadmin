require 'test_helper'

module Shadmin
  class DashboardControllerTest < ActionController::TestCase
    def setup
			@admin = create(:admin)
		end

	  # GET :index /admin
	  def test_index_routing
			assert_routing '/dashboard', { controller: 'shadmin/dashboard', action: 'index' }
	  end

	  def test_index
	  	sign_in @admin
	  	get :index, use_route: :shadmin
	  	assert_response :success
	  	assert_template layout: 'shadmin/application'
	  	assert_template 'dashboard/index'
	  end

	  def test_redirect_non_logged_in_user_for_index
	  	sign_out @admin
	  	get :index, use_route: :shadmin
	  	# binding.pry
	  	assert_redirected_to new_admin_session_path
	  end
  end
end
