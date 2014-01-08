require_dependency "shadmin/application_controller"

module Shadmin
  class AdminUsersController < ApplicationController
		before_filter :find_all_admin_users, only: :index
		before_filter :find_admin_user, only: [:show, :edit, :update, :destroy]
		before_filter :build_admin_user, only: [:new, :create]

		def index
		end

		def show
		end

		def new
		end

		def create
			if @admin_user.save
				flash[:success] = 'Successfully created new admin user.'
				redirect_to admin_user_path(@admin_user)
			else
				flash[:error] = 'Error creating new admin user.'
				render :new
			end
		end

		def edit
		end

		def update
			if @admin_user.update admin_params
				flash[:success] = 'Successfully updated admin user.'
				redirect_to admin_user_path(@admin_user)
			else
				flash.now[:error] = 'Error updating admin user.'
				render :edit
			end
		end

		def destroy
			@admin_user.destroy!
			# logout user if same as current_user
			if current_admin == @admin_user
				redirect_to destroy_admin_session_path, via: :delete
			else
				flash[:success] = 'Successfully deleted admin user.'
				redirect_to admin_users_path
			end
		end

		private

			def build_admin_user
				begin
					@admin_user = Admin.new admin_params
				rescue ActionController::ParameterMissing
					@admin_user = Admin.new
				end
			end

			def find_admin_user
				begin
					@admin_user = Admin.find params[:id]
				rescue ActiveRecord::RecordNotFound
					flash[:error] = "Could not find admin user with id=#{params[:id]}"
					redirect_to :back
				end
			end

			def find_all_admin_users
				@admin_users = Admin.all
			end

			def admin_params
				params.require(:admin).permit(:email, :password, :password_confirmation)
			end
	end
end
