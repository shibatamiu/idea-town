class RanksController < ApplicationController

    def rank
        @rank_thoughts = Thought.all.sort {|a,b| b.liked_users.count <=> a.liked_users.count}
    end
end
