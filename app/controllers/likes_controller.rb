class LikesController < ApplicationController
    before_action :authenticate_user!
    # change all of these to work with the likes, then
    # change the views to look more similar to the wireframe
    # then finished
    def create
      idea = Idea.find(params[:idea_id])
      like = Like.new(user: current_user, idea: idea)
      if !can?(:like, idea)
        redirect_to idea, alert: "can't like your own Idea"
      elsif like.save
        flash[:success] = "Idea Liked"
        redirect_to idea_path(idea)
      else
        flash[:danger] = like.errors.full_messages.join(", ")
        redirect_to idea_path(idea)
      end
    end
  
    def destroy
      like = current_user.likes.find(params[:id])
      if can? :destroy, like
        like.destroy
        flash[:success] = "Idea unliked"
        redirect_to idea_path(like.idea)
      else
        flash[:danger] = "Can't delete like"
        redirect_to idea_path(like.idea)
      end
    end
end
