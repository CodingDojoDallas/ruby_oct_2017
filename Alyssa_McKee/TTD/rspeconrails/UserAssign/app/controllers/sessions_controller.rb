class SessionsController < ApplicationController
	before_action :logout_required, only: [:new, :create]
	
	before_action :login_required, except: [:new, :create]
	
	def new
		
	end
	def create
		email = params[:session][:email].downcase
		@user = User.find_by_email(email)
		if @user
			if @user.try(:authenticate, params[:session][:password])
				session[:user_id] = @user.id
				return redirect_to "/users/#{@user.id}"
			end
			flash[:error] = "Password does not match"
			return redirect_to login_path
		end
		flash[:error] = "Email not found"
		return redirect_to login_path
	end
	def destroy
			session.delete(:user_id) if session.has_key? :user_id
		return redirect_to login_path
	end
	private
		def session_params
			params.require(:session).permit(:email, :password)
		end
end
