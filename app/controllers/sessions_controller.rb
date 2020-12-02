class SessionsController < ApplicationController

    skip_before_action :authorized, only: [:new, :login]

    def logout 
        cookies.delete(:user_id) 
        redirect_to users_path
    end     

    def new 
    end 

    def login 

        user = User.find_by(user_name: params[:session][:user_name])

        if user && user.authenticate(params[:session][:password])
          cookies[:user_id] = user.id
          redirect_to users_path
        else
          flash[:errors] = "Username or Password does not match"
          redirect_to new_login_path
        end 
     end 

end
