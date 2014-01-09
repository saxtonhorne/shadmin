require 'test_helper'

module Shadmin
  class AdminUsersControllerTest < ActionController::TestCase
    def setup
	  	@admin = create(:admin)
	  end

	  # GET :index /admin/admin_users
	  def test_index_routing
	  	assert_routing '/admin_users', { controller: 'shadmin/admin_users', action: 'index' }
	  end

	  def test_index
	  	sign_in @admin
	  	get :index, use_route: :shadmin
	  	assert_response :success
	  	assert assigns(:admin_users)
	  	assert_template layout: 'shadmin/application'
	  	assert_template 'admin_users/index'
	  end

	  def test_redirect_non_logged_in_user_for_index
	  	sign_out @admin
	  	get :index
	  	assert_redirected_to new_admin_session_path
	  end

	  # GET :show /admin/admin_users/1 
	  def test_show_routing
	  	assert_routing '/admin_users/1', { controller: 'shadmin/admin_users', action: 'show', id: '1' }
	  end

	  def test_show
	  	sign_in @admin
	  	get :show, use_route: :shadmin, id: @admin.id
	  	assert_response :success
	  	assert assigns(:admin_user)
	  	assert_template layout: 'shadmin/application'
	  	assert_template 'admin_users/show'
	  end	

	  def test_redirect_non_logged_in_user_for_show
	  	sign_out @admin
	  	get :show, use_route: :shadmin, id: @admin.id
	  	assert_redirected_to new_admin_session_path
	  end

	  def test_find_admin_user_failure
	  	sign_in @admin
	  	@request.env["HTTP_REFERER"] = admin_users_path
	  	get :show, use_route: :shadmin, id: 13	
	  	assert_redirected_to admin_users_path
	  	assert_equal 'Could not find admin user with id=13', flash[:error]
	  end

	  # GET :new /admin/admin_users/new
	  def test_new_routing
	  	assert_routing '/admin_users/new', { controller: 'shadmin/admin_users', action: 'new' }
	  end

	  def test_new
	  	sign_in @admin
	  	get :new, use_route: :shadmin
	  	assert_response :success
	  	assert assigns(:admin_user), "Should assign @admin_user"
	  	assert_template layout: 'shadmin/application'
	  	assert_template 'admin_users/new'
	  	assert_select "form[action=?]", "/admin/admin_users"
	  	assert_select "form[method=?]", 'post'
	  end	

	  def test_redirect_non_logged_in_user_for_new
	  	sign_out @admin
	  	get :new, use_route: :shadmin
	  	assert_redirected_to new_admin_session_path
	  end


	  # POST :create /admin/admin_users
	  def test_create_routing
	  	assert_routing({ path: '/admin_users', method: 'post' }, { controller: 'shadmin/admin_users', action: 'create' })
	  end

	  def test_create
	  	sign_in @admin
	  	assert_difference 'Admin.count' do
		  	post :create, use_route: :shadmin, admin: { email: 'arnold@example.com', password: 'password123', password_confirmation: 'password123' }
		  end
	  	admin_user = Admin.find_by(email: 'arnold@example.com')
	  	assert admin_user
	  	assert_redirected_to admin_user_path(admin_user)
	  	assert_equal 'Successfully created new admin user.', flash[:success]
	  end	

	  def test_create_failure
	  	sign_in @admin
	  	assert_no_difference 'Admin.count' do
		  	post :create, use_route: :shadmin, admin: { email: 'adam@example.com', password: 'password123', password_confirmation: 'password123' }
		  end
	  	assert_template 'admin_users/new'
	  	assert_equal 'Error creating new admin user. Email has already been taken.', flash[:error]
	  end	

	  def test_redirect_non_logged_in_user_for_create
	  	sign_out @admin
	  	assert_no_difference 'Admin.count' do
		  	post :create, use_route: :shadmin, admin: { email: 'adam45@example.com', password: 'password123', password_confirmation: 'password123' }
		  end
	  	assert_redirected_to new_admin_session_path
	  end


	  # GET :edit /admin/admin_users/1/edit
	  def test_edit_routing
	  	assert_routing '/admin_users/1/edit', { controller: 'shadmin/admin_users', action: 'edit', id: '1' }
	  end

	  def test_edit
	  	sign_in @admin
	  	get :edit, use_route: :shadmin, id: @admin.id
	  	assert_response :success
	  	assert assigns(:admin_user), "Should assign @admin_user"
	  	assert_template layout: 'shadmin/application'
	  	assert_template 'admin_users/edit'
	  	assert_select "form[action=?]", "/admin/admin_users/#{@admin.id}"
	  end	

	  def test_redirect_non_logged_in_user_for_edit
	  	sign_out @admin
	  	get :edit, use_route: :shadmin, id: @admin.id
	  	assert_redirected_to new_admin_session_path
	  end

	  # PATCH :update /admin/admin_users/1
	  def test_update_routing
	  	assert_routing({ path: '/admin_users/1', method: 'patch' }, { controller: 'shadmin/admin_users', action: 'update', id: '1' })
	  end

	  def test_update
	  	sign_in @admin
	  	patch :update, use_route: :shadmin, id: @admin.id, admin: { email: 'adam2@example.com', password: 'password123', password_confirmation: 'password123' }
	  	assert_redirected_to admin_user_path(@admin)
	  	assert_equal 'Successfully updated admin user.', flash[:success]
	  	assert_equal 'adam2@example.com', @admin.reload.email, "Email should have been updated"
	  end	

	  def test_update_failure
	  	create(:admin, email: 'bob@example.com')
	  	sign_in @admin
	  	# update user with same email as users(:bob)
	  	patch :update, use_route: :shadmin, id: @admin.id, admin: { email: 'bob@example.com', password: 'pass', password_confirmation: 'pass' }
	  	assert_template 'admin_users/edit'
	  	assert_equal 'Error updating admin user. Email has already been taken. Password is too short (minimum is 8 characters).', flash[:error]
	  	assert_equal 'adam@example.com', @admin.reload.email, "Email should not have been updated"
	  end	

	  def test_redirect_non_logged_in_user_for_update
	  	sign_out @admin
	  	patch :update, use_route: :shadmin, id: @admin.id, admin: { email: 'adam3@example.com', password: 'password123', password_confirmation: 'password123' }
	  	assert_redirected_to new_admin_session_path
	  	assert_equal 'adam@example.com', @admin.reload.email, "Email should not have been updated"
	  end

	  # # DELETE :destroy /admin/admin_users/1
	  def test_delete_routing
	  	assert_routing({ path: '/admin_users/1', method: 'delete' }, { controller: 'shadmin/admin_users', action: 'destroy', id: '1' })
	  end

	  def test_delete
	  	new_admin = create(:admin, email: 'bob@example.com')
	  	sign_in @admin
	  	assert_difference 'Admin.count', -1 do
	  		delete :destroy, use_route: :shadmin, id: new_admin.id	
	  	end
	  	assert_redirected_to admin_users_path
	  	assert_equal 'Successfully deleted admin user.', flash[:success]
	  	refute Admin.where(id: new_admin.id).any?
	  end	

	  def test_logout_current_admin_if_same_as_deleted_admin_user
	  	sign_in @admin
  		delete :destroy, use_route: :shadmin, id: @admin.id	
	  	refute signed_in?
	  end

	  def test_redirect_non_logged_in_user_for_delete
	  	sign_out @admin
	  	assert_no_difference 'Admin.count' do
		  	delete :destroy, use_route: :shadmin, id: @admin.id
		  end
	  	assert_redirected_to new_admin_session_path
	  	assert Admin.where(id: @admin.id).any?
	  end
  end
end
