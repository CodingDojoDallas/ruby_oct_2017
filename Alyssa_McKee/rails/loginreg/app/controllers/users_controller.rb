class UsersController < ApplicationController
	before_action :login_required, except: [:new, :create]
	before_action :auth, only: [:edit, :update, :destroy]
	
	def index
		@users = User.all
	end
	def show
		@user = User.find_by(id: params[:id])
		#redirect_to user_error unless user
	end
	def new
		
	end
	def create
		user = User.create(register_params)
		if user.valid?
			flash[:success] = "Registration Successful"
			session[:user_id] = user.id
			return redirect_to show_user_path user.id
		end
		flash[:errors] = user.errors.full_messages
		return redirect_to register_path
	end
	
	def edit
		@user = current_user
	end
	
	def update
		user = current_user
		user.update(edit_params)
		if user.valid?
			flash[:success] = "Edit Successful"
			return redirect_to show_user_path user.id
		end
		flash[:errors] = user.errors.full_messages
		return redirect_to edit_user_path user.id
	end
	
	def destroy
		user = current_user
		user.destroy
		session.delete(:user_id) if session.has_key? "user_id"
		return redirect_to landing_path
	end
	
	private
		def register_params
			params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)	
		end
		def edit_params
			params.require(:user).permit(:first_name, :last_name, :email).reject{ |key, val| val.blank? }
		end
end
