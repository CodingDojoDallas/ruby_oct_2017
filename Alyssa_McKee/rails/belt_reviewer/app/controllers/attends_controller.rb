class AttendsController < ApplicationController
	before_action :login_required
	before_action :event_exists
	
	def create
		event = Event.find(params[:id])
		attending = event.users
		user = current_user
		Attend.create(user: user, event: event) unless attending.include? user
		flash[:success] = "event joined" unless attending.include? user
		return redirect_to_back
		
	end
	
	def destroy
		event = Event.find(params[:id])
		attending = event.users
		user = current_user
		Attend.find_by(user: user, event: event).destroy if attending.include? user
		flash[:success] = "event canceled" if attending.include? user
		return redirect_to_back
	end
	
end
