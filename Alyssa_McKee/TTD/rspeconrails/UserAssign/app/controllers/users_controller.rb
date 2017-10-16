class UsersController < ApplicationController
	
	def show
		@user = User.find(params[:id])
	end
	def new
	
	end
	def create
		user = User.create(user_params)
		
		if user.valid?
			session[:user_id] = user.id
			return redirect_to "/users/#{user.id}"
		end
		flash[:errors] = user.errors.full_messages
		return redirect_to "/users/new"
		
	end
	def edit
	
	end
	def update
		# return redirect_to "users/#{user.id}"
	end
	
	private
		def user_params
			params.require(:user).permit(:name, :email, :password, :password_confirmation)
		end
end
