class RanksController < ApplicationController

    def rank
        @rank_thoughts = params[:tag_id].present? ? Tag.find(params[:tag_id]).thoughts.sort {|a,b| b.liked_users.count <=> a.liked_users.count} : Thought.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
        @rank_thoughts = Kaminari.paginate_array(@rank_thoughts).page(params[:page]).per(5)
        
    end
end
