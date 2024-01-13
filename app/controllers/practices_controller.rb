class PracticesController < ApplicationController

    def create
        practice = Practice.new(practice_params)
    
        practice.user_id = current_user.id  #追記
    
        if practice.save
          redirect_to action: "index"
        else
          redirect_to action: "new"
        end
    end

    
    def index
        @practices = Practice.all
    end

end
