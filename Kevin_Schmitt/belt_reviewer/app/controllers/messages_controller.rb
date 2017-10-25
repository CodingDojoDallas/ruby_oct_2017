class MessagesController < ApplicationController

    def create
        message = Message.create(message_params)
        if message.valid?

            return redirect_to :back
        end
        flash[:errors] = message.errors.full_messages
        redirect_to :back
    end



    private
    def message_params
        params.require(:message).permit(:content).merge(user_id: current_user.id, event_id: params[:id])
    end
end
