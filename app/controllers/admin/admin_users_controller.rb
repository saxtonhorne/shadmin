class Admin::AdminUsersController < AdminController
	before_filter :find_admin_user, only: [:show, :edit, :update, :destroy]

	def index
		@admin_users = Admin.all
	end

	def show
	end

	def new
		@admin_user = Admin.new
	end

	def edit
	end

	def update
		if @admin_user.update admin_params
			flash[:success] = 'Successfully updated admin user.'
			redirect_to admin_admin_user_path(@admin_user)
		else
			flash.now[:error] = 'Error updating admin user.'
			render :edit
		end
	end

	def destroy
		@admin_user.destroy!
		flash[:success] = 'Successfully deleted admin user.'
		redirect_to admin_admin_users_path
	end

	private

		def find_admin_user
			begin
				@admin_user = Admin.find params[:id]
			rescue ActiveRecord::RecordNotFound
				flash[:error] = "Could not find admin user with id=#{params[:id]}"
				redirect_to :back
			end
		end

		def admin_params
			params.require(:admin).permit(:email, :password, :password_confirmation)
		end
end
