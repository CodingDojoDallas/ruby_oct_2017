class UsersController < ApplicationController
	before_action :login_required, except: [:new, :create]
	before_action :auth, only: [:edit, :update, :destroy]
	before_action :user_exists, only: [:show, :edit, :create, :destroy, :update]
	def index
		@users = User.all
	end
	def show
		@user = User.find_by(id: params[:id])
		@attending = @user.events
		@hosting = @user.hosted_events
		return redirect_to dashboard_path unless @user
	end
	def new
		@states = Location.states
		return redirect_to dashboard_path if current_user
	end
	def create
		location = Location.get_or_create(location_params)
		user = User.new(register_params)
		user.location = location
		user.save
		if user.valid? and location.valid?
			flash[:success] = "Registration Successful"
			session[:user_id] = user.id
			return redirect_to show_user_path user.id
		end
		flash[:errors] = user.errors.full_messages
		flash[:errors] += location.errors.full_messages
		return redirect_to register_path
	end
	
	def edit
		@user = current_user
		@state = @user.location.state
		@states = Location.states
	end
	
	def update
		user = current_user
		user.update(edit_params)
		location = Location.get_or_create(location_params)
		user.location = location
		if user.valid? and location.valid?
			user.save
			location.save
			flash[:success] = "Edit Successful"
			return redirect_to show_user_path user.id
		end
		flash[:errors] = user.errors.full_messages
		flash[:errors] += location.errors.full_messages
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
