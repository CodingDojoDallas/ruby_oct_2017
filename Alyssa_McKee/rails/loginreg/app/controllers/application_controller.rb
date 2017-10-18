class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def current_user
	User.find_by(id: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def auth
		user = current_user
		unless user and user.id == params[:id].to_i
			flash[:hacker] = "nice try hacker"
			begin
				return redirect_to :back
			rescue ActionController::RedirectBackError
				return redirect_to login_path
			end
		end
  end
  helper_method :auth
  
  def login_required
		flash[:hacker] = "nice try hacker" unless current_user
		return redirect_to login_path unless current_user
  end
  helper_method :login_required
  
end
