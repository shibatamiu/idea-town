class ThoughtsController < ApplicationController
    before_action :authenticate_user!

    def index
        
        if params[:search] != nil && params[:search] != ''
            search = params[:search]
            @thoughts = Thought.joins(:user).order("created_at DESC").where("title LIKE ? OR about LIKE ? OR name LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%").page(params[:page]).per(3)
        else
            @thoughts = params[:tag_id].present? ? Tag.find(params[:tag_id]).thoughts.order(id: "DESC").page(params[:page]).per(3) : Thought.all.order(id: "DESC").page(params[:page]).per(3)
        end
        @rank_thoughts = Thought.all.page(params[:page]).per(3).sort {|a,b| b.liked_users.count <=> a.liked_users.count}

    end


    def new
        @thought = Thought.new
    end

    def create
        thought = Thought.new(thought_params)
        thought.user_id = current_user.id
        if thought.save
            redirect_to :action => "index"
        else
            redirect_to :action => "new"
        end
    end

    def show
        @thought = Thought.find(params[:id])
        @comments = @thought.comments
        @comment = Comment.new
    end

    def edit
        @thought = Thought.find(params[:id])
    end

    def update
        thought = Thought.find(params[:id])
        if thought.update(thought_params)
            redirect_to :action => "show", :id => thought.id
        else
            redirect_to :action => "new"
        end
    end

    def destroy
        thought = Thought.find(params[:id])
        thought.destroy
        redirect_to action: :index
    end


    private
    def thought_params
        params.require(:thought).permit(:title, :about, :image, tag_ids: [])
    end
end
