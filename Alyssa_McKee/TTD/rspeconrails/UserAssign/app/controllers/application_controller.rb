class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
	
	
	def current_user
		User.find(session[:user_id]) if session[:user_id]
	end
	
	def login_required
		redirect_to login_path unless current_user
	end
	
	def logout_required
		redirect_to secrets_path if current_user
	end
	
	helper_method :logout_required
	
	helper_method :login_required
	
	helper_method :current_user
	
end
