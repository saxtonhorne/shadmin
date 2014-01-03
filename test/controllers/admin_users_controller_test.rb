require 'test_helper'

class Admin::AdminUsersControllerTest < ActionController::TestCase
  def setup
  	@admin = admins :adam
  end

  # GET /admin/admin_user
  def test_index_routing
  	assert_routing '/admin/admin_users', { controller: 'admin/admin_users', action: 'index' }
  end

  def test_index
  	sign_in @admin
  	get :index
  	assert_response :success
  	assert_template layout: 'admin'
  	assert_template 'admin_users/index'
  	assert assigns(:admin_users)
  end

  def test_redirect_non_logged_in_user_for_index
  	sign_out :admin
  	get :index
  	assert_redirected_to new_admin_session_path
  end

  # GET /admin/admin_user/1 
  def test_show_routing
  	assert_routing '/admin/admin_users/1', { controller: 'admin/admin_users', action: 'show', id: '1' }
  end

  def test_show
  	sign_in @admin
  	get :show, id: @admin.id
  	assert_response :success
  	assert_template layout: 'admin'
  	assert_template 'admin_users/show'
  	assert assigns(:admin_user)
  end	

  def test_redirect_non_logged_in_user_for_show
  	sign_out :admin
  	get :show, id: @admin.id
  	assert_redirected_to new_admin_session_path
  end

  # GET /admin/admin_user/1/edit
  def test_edit_routing
  	assert_routing '/admin/admin_users/1/edit', { controller: 'admin/admin_users', action: 'edit', id: '1' }
  end

  def test_edit
  	sign_in @admin
  	get :edit, id: @admin.id
  	assert_response :success
  	assert_template layout: 'admin'
  	assert_template 'admin_users/edit'
  	assert assigns(:admin_user), "Should assign @admin_user"
  	assert_select "form[action=?]", "/admin/admin_users/#{@admin.id}"
  end	

  def test_redirect_non_logged_in_user_for_edit
  	sign_out :admin
  	get :edit, id: @admin.id
  	assert_redirected_to new_admin_session_path
  end

end
