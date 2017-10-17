class UsersController < ApplicationController
	
	before_action :login_required, except: [:new, :create]
	
	before_action :logout_required, only: [:new, :create]
	
	def show
		@user = User.find(params[:id])
		@secrets = @user.secrets
		@likes = @user.secrets_liked
		
		@current_user = current_user
		@current_likes = current_user.secrets_liked
	end
	
	def new
	end
	
	def create
		user = User.create(user_params)
		
		if user.valid?
			return redirect_to "/sessions/new"
		end
		flash[:errors] = user.errors.full_messages
		return redirect_to "/users/new"
	end
	
	def edit
		return redirect_to(edit_user_path current_user) unless session[:user_id] == params[:id].to_i
		@user=User.find(params[:id])
		
	end
	
	def update
		user = current_user
		user.update(update_params)
		if user.save
			return redirect_to "/users/#{user.id}"
			
		end
		flash[:errors] = user.errors.full_messages
		return redirect_to edit_user_path current_user.id
	end
	
	def destroy
		user = current_user
		user.destroy		
		session.delete(:user_id)
		return redirect_to users_new_path
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
		def update_params
			params.require(:user).permit(:name, :email)
		end
end
