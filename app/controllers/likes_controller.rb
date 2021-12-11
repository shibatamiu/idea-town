class LikesController < ApplicationController

    def create
        like = current_user.likes.create(thought_id: params[:thought_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        like = Like.find_by(thought_id: params[:thought_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
    end

end
