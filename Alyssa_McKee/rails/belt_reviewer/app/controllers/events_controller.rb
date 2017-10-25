class EventsController < ApplicationController
	before_action :login_required
	before_action :event_auth, only: [:edit, :update, :destroy]
	before_action :event_exists, only:[:show, :update, :destroy, :edit]
	def index
		@states = Location.states
		@user = current_user
		@instate_events = Event.joins(:location).where('locations.state = ?', @user.location.state)
		
		@out_of_state_events = Event.joins(:location).where('locations.state != ?', @user.location.state)
	end
	def create
		location = Location.get_or_create(location_params)
		event = Event.new(event_params)
		event.location = location
		event.host = current_user
		event.save
		if event.valid? and location.valid?
			flash[:success] = "Event created successfully"
			return redirect_to show_event_path event.id
		end
		flash[:errors] = event.errors.full_messages
		flash[:errors] += location.errors.full_messages
		return redirect_to dashboard_path	
	end
	def show
		@event = Event.find_by(id: params[:id])
		@host = @event.host
		@location = @event.location
		@guests = @event.users.includes(:location)
		@comments = @event.comments
	end
	def update
		event = Event.find_by(id: params[:id])
		event.update(event_params)
		event.location = Location.get_or_create(location_params)
		if event.valid? and event.location.valid?
			event.save
			flash[:success] = "event information updated"
			return redirect_to show_event_path event.id
		end
		flash[:errors] = event.errors.full_messages
		flash[:errors] += event.location.errors.full_messages
		return redirect_to edit_event_path event.id
	end
	def destroy
		event = Event.find(params[:id])
		event.destroy
		flash[:success] = "event deleted"
		return redirect_to dashboard_path
	end
	def edit
		@event = Event.find_by(id: params[:id])
		@state = @event.location.state
		@states = Location.states
	end
	
	private
		def event_params
			params.require(:event).permit(:name, :date)
		end
		def event_auth
			event = Event.find_by(id: params[:id])
			flash[:hacker] = "you do not own that event" unless event.host == current_user
			return redirect_to dashboard_path unless event.host == current_user
		end
		
end
