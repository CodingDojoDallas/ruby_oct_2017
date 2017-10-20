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
		return redirect_to_back
	end
  end
  
  def user_exists
	user = User.find_by(id: params[:id])
	flash[:hacker] = "user does not exist" unless user
	return redirect_to_back unless user
  end
  helper_method :user_exists
  
  helper_method :auth
  def event_exists
	event = Event.find_by(id: params[:id])
	flash[:hacker] = "event does not exist" unless event
	return redirect_to_back unless event
  end
  helper_method :event_exists
  
  def login_required
		flash[:hacker] = "nice try hacker" unless current_user
		return redirect_to login_path unless current_user
  end
  helper_method :login_required
  
  def location_params
	params.require(:location).permit(:city, :state)
  end
  helper_method :location_params
  
  def attending? event
	return event.users.include? current_user
  end
  helper_method :attending?
  
  def hosting? event
	return event.host == current_user
  end
  helper_method :hosting?
  
  
  #vvv USEFULLLLLL vvv$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
  def redirect_to_back
	begin
		return redirect_to :back
	rescue ActionController::RedirectBackError
		return redirect_to dashboard_path
	end
  end
  helper_method :redirect_to_back
  
end