class SessionsController < ApplicationController

    def logout 
        cookies.delete(:user_id) 
        redirect_to new_user_path
    end 

    def login 
        #user = User.find_by(user_)
    end 
end
