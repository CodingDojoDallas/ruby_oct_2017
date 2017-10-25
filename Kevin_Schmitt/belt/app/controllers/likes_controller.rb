class LikesController < ApplicationController


    def like
        idea = Idea.find(params[:id])
        Like.create(user: current_user, idea: idea)
        return redirect_to :back
    end

    def unlike
        like = Like.find_by_user_id_and_idea_id(current_user.id, params[:id])
        like.delete
        return redirect_to :back
    end









end
