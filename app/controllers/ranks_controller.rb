class RanksController < ApplicationController

    def rank
        if params[:search] != nil && params[:search] != ''
            search = params[:search]
            @thoughts = Thought.joins(:user).order(id: "DESC").where("title LIKE ? OR about LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
        else
            @thoughts = params[:tag_id].present? ? Tag.find(params[:tag_id]).thoughts.order(id: "DESC").page(params[:page]).per(3) : Thought.all.order(id: "DESC").page(params[:page]).per(3)
        end
        @rank_thoughts = params[:tag_id].present? ? Tag.find(params[:tag_id]).thoughts.page(params[:page]).per(3).sort {|a,b| b.liked_users.count <=> a.liked_users.count} : Thought.all.page(params[:page]).per(3).sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end
end
