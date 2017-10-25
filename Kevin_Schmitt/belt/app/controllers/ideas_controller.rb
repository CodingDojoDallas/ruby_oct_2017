class IdeasController < ApplicationController
  def show
  end


  def create
    idea = Idea.create(idea_params)
    if idea.valid?
        return redirect_to :back
    end
    flash[:errors] = idea.errors.full_messages
    redirect_to :back
  end

  def oneidea
    @idea = Idea.find(params[:id])
    if current_user
      
      return render 'ideas/oneidea'
    end
    return redirect_to root_path
  end

  def destroy
    likes = Like.where(idea_id: params[:id])
    likes.each {|a| a.delete}
    # messages = Message.where(event_id: params[:id])
    # messages.each {|a| a.delete}
    idea = Idea.find(params[:id])
    if current_user.id == idea.user_id
      idea.delete
      return redirect_to :back
    end
    return redirect_to :back
  end

  private
  def idea_params
      params.require(:idea).permit(:content).merge(user_id: current_user.id)
  end
end
