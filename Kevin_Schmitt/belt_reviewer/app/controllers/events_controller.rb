class EventsController < ApplicationController

  def show
    if current_user
      @events = Event.all
      return render 'events/show'
    end
    redirect_to root_path
  end

  def showone
    @event = Event.find(params[:id])
  end

  def create
    event = Event.create(event_params)
    if event.valid?
      Attend.create(user: current_user, event: event)
      return redirect_to :back
    end
    flash[:errors] = event.errors.full_messages
    return redirect_to :back
  end

  def destroy
    attends = Attend.where(event_id: params[:id])
    attends.each {|a| a.delete}
    messages = Message.where(event_id: params[:id])
    messages.each {|a| a.delete}
    event = Event.find(params[:id])
    if current_user.id == event.user_id
      event.delete
      return redirect_to :back
    end
    return redirect_to :back 
  end

  private
  def event_params
      params.require(:event).permit(:name, :date, :city,:state).merge(user_id: current_user.id)
  end

end
