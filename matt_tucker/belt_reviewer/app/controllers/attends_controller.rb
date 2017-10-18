class AttendsController < ApplicationController

    def create
        Attend.create(attend_params)

        return redirect_back fallback_location: events_path
    end

    def destroy

    end

    private
        def attend_params
            params.require(:attend).permit(:event_id).merge(user: current_user)
        end
end
