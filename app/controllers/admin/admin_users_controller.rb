class Admin::AdminUsersController < AdminController
	before_filter :find_admin_user, only: [:show, :edit, :update]

	def index
		@admin_users = Admin.all
	end

	def show
	end

	def edit
	end

	def update
		if @admin_user.update admin_params
			flash[:success] = 'Successfully updated admin user.'
			redirect_to admin_admin_user_path(@admin_user)
		end
	end

	private

		def find_admin_user
			@admin_user = Admin.find params[:id]
		end

		def admin_params
			params.require(:admin).permit(:email, :password, :password_confirmation)
		end
end
