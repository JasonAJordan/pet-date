class ApplicationController < ActionController::Base
    before_action :find_current_user 
    
    before_action :authorized   

    helper_method :mailbox 
    
    def find_current_user
        # @current_alien = Alien.find(cookies[:alien_id])
        @current_user = User.find_by(id: cookies[:user_id])
    end 

    def authorized 
        redirect_to new_user_path unless @current_user
    end 

    def mailbox
        @mailbox ||= @current_user.mailbox
    end

      private 

    def conversation 
        @conversation ||= mailbox.conversations.find(params[:id])
    end 

end
