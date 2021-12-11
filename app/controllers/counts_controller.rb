class CountsController < ApplicationController

    def create
        count = current_user.counts.create(thought_id: params[:thought_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        count = Count.find_by(thought_id: params[:thought_id], user_id: current_user.id)
        count.destroy
        redirect_back(fallback_location: root_path)
    end


end
