class UsersController < ApplicationController

    def show
        @user = User.find(params[:id]) 
      end
    
    def mypage
      redirect_to action: "show", id:current_user.id
    end
    

end
