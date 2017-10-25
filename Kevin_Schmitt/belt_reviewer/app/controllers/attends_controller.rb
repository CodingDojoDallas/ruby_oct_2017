class AttendsController < ApplicationController

    def create
        attend = Attend.create(event_id: params[:id], user_id: current_user.id)
        if attend.valid?
            return redirect_to :back
        end
        flash[:errors] = attend.errors.full_messages
        redirect_to :back
    end

    def leave
        attend = Attend.find_by(event_id: params[:id], user: current_user)
        attend.delete
        redirect_to :back
    end



    # private
    # def user_params
    #     params.require(:user).permit(:first_name, :last_name, :email, :city, :state, :password, :password_confirmation).merge(user_id: current_user.id)
    # end



end
