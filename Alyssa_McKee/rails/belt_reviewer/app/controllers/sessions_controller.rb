class SessionsController < ApplicationController
	
	before_action :login_required, only: [:destroy]
	
	def new
		return redirect_to dashboard_path if current_user
	end
	
	def create		
		email = params[:session][:email].downcase
		@user = User.find_by_email(email)
		if @user
			if @user.try(:authenticate, params[:session][:password])
				session[:user_id] = @user.id
				return redirect_to "/users/#{@user.id}"
			end
			flash[:errors] = "Password does not match"
			return redirect_to login_path
		end
		flash[:errors] = "Email not found"
		return redirect_to login_path
	end
	
	def destroy
		session.delete(:user_id) if session.has_key? :user_id
		return redirect_to landing_path
	end
	
	def error
		@path = params[:path]
	end

end
