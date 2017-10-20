class CommentsController < ApplicationController
before_action :login_required
before_action :event_exists

	def create
		comment = Comment.new(comment_params)
		comment.user = current_user
		comment.event = Event.find(params[:id])
		flash[:errors] = comment.errors.full_messages unless comment.save
		return redirect_to show_event_path comment.event.id
	end
	private
		def comment_params
			params.require(:comment).permit(:content)
		end

end
