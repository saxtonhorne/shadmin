require 'test_helper'

class Admin::AdminUsersControllerTest < ActionController::TestCase
  def setup
  	@admin = admins :adam
  end

  def test_find_admin_user_failure
  	sign_in @admin
  	request.env["HTTP_REFERER"] = admin_admin_users_path
  	get :show, id: 13	
  	assert_redirected_to admin_admin_users_path
  	assert_equal 'Could not find admin user with id=13', flash[:error]
  end

  # GET :index /admin/admin_user
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

  # GET :show /admin/admin_user/1 
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


  # GET :new /admin/admin_user/new
  def test_new_routing
  	assert_routing '/admin/admin_users/new', { controller: 'admin/admin_users', action: 'new' }
  end

  def test_new
  	sign_in @admin
  	get :new
  	assert_response :success
  	assert_template layout: 'admin'
  	assert_template 'admin_users/new'
  	assert assigns(:admin_user), "Should assign @admin_user"
  	assert_select "form[action=?]", "/admin/admin_users"
  	assert_select "form[method=?]", 'post'
  end	

  def test_redirect_non_logged_in_user_for_new
  	sign_out :admin
  	get :new
  	assert_redirected_to new_admin_session_path
  end


  # GET :edit /admin/admin_user/1/edit
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

  # PATCH :update /admin/admin_user/1
  def test_update_routing
  	assert_routing({ path: '/admin/admin_users/1', method: 'patch' }, { controller: 'admin/admin_users', action: 'update', id: '1' })
  end

  def test_update
  	sign_in @admin
  	patch :update, id: @admin.id, admin: { email: 'adam2@example.com', password: 'password123', password_confirmation: 'password123' }
  	assert_redirected_to admin_admin_user_path(@admin)
  	assert_equal 'Successfully updated admin user.', flash[:success]
  	assert_equal 'adam2@example.com', @admin.reload.email, "Email should have been updated"
  end	

  def test_update_failure
  	sign_in @admin
  	# update user with same email as users(:bob)
  	patch :update, id: @admin.id, admin: { email: 'bob@example.com', password: 'password123', password_confirmation: 'password123' }
  	assert_template 'admin_users/edit'
  	assert_equal 'Error updating admin user.', flash[:error]
  	assert_equal 'adam@example.com', @admin.reload.email, "Email should not have been updated"
  end	

  def test_redirect_non_logged_in_user_for_update
  	sign_out :admin
  	patch :update, id: @admin.id, admin: { email: 'adam3@example.com', password: 'password123', password_confirmation: 'password123' }
  	assert_redirected_to new_admin_session_path
  	assert_equal 'adam@example.com', @admin.reload.email, "Email should not have been updated"
  end

  # DELETE :destroy /admin/admin_user/1
  def test_delete_routing
  	assert_routing({ path: '/admin/admin_users/1', method: 'delete' }, { controller: 'admin/admin_users', action: 'destroy', id: '1' })
  end

  def test_delete
  	sign_in @admin
  	admin_id = @admin.id
  	assert_difference 'Admin.count', -1 do
  		delete :destroy, id: admin_id	
  	end
  	assert_redirected_to admin_admin_users_path
  	assert_equal 'Successfully deleted admin user.', flash[:success]
  	refute Admin.where(id: admin_id).any?
  end	

  def test_redirect_non_logged_in_user_for_delete
  	sign_out :admin
  	assert_no_difference 'Admin.count' do
	  	delete :destroy, id: @admin.id
	  end
  	assert_redirected_to new_admin_session_path
  	assert Admin.where(id: @admin.id).any?
  end

end
