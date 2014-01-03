class Admin::AdminUsersController < AdminController
	def index
		@admin_users = Admin.all
	end

	def show
		@admin_user = Admin.find params[:id]
	end

	def edit
		@admin_user = Admin.find params[:id]
	end
end
