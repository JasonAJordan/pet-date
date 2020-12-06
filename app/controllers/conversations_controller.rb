class ConversationsController < ApplicationController

    def new 
      @users = User.all #CHANGE THIS TO ONLY GET if USER HAS A ACCEPTED AN INVITE
      @current_user
      #ignore what is below
  
      @list = @users

    #   @users.each do |user| 
    #       user.pets.each do |pet| 
    #         pet.requested_relationships.each do |meeting| 
    #          if meeting.status == "Accepted" #&& meeting.requester_id == @current_user.id
              
    #           @list2 += meeting
    #          end 
    #       end 

    #       pet.requestie_relationships.select do |meeting| 
    #           if meeting.status == "Accepted" #&& (meeting.requestie_id == @current_user.id)
    #             @list2 += meeting
    #           end 
    #       end 

    #       end 
    # end
    
    # @users2 = @users.select {|user| user.pets.select {|pet| pet.requested_relationships.select {|meeting| meeting.status == "Accepted" }}}

    # @pets = Pet.all 

    # @pet_id_list = @current_user.pets.map {|pet| pet.id }
      # ignore what is above  

    @meetings = Meeting.all 
    @meetings_2 = @meetings.select do |meeting| 
               (meeting.status == "Accepted") && (@pet_id_list.include?(meeting.requester_id)) || 
               (meeting.status == "Accepted") && (@pet_id_list.include?(meeting.requestie_id))
               
    end 

    @user_list_1 = @meetings_2.map do |meeting| 
      meeting.requester.user
    end 
    @user_list_2 = @meetings_2.map do |meeting| 
      meeting.requestie.user
    end 

    @user_messaging_list = @user_list_1 + @user_list_2
    @user_messaging_list.uniq! {|e| e[:id] }

    

    end 
    
    def create
      recipients = User.where(id: conversation_params[:recipients])
      conversation = @current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
      flash[:success] = "Your message was successfully sent!"
      redirect_to conversation_path(conversation)
      
    end
  
    def show
      @receipts = conversation.receipts_for(@current_user)
      # mark conversation as read
      @conversation.mark_as_read(@current_user)
    end
  
  def reply 
    @current_user.reply_to_conversation(conversation, message_params[:body])
    flash[:notice] = "Your reply wass successfully sent!"
    redirect_to conversation_path(conversation)
  end

    def conversation_params
      params.require(:conversation).permit(:subject, :body,recipients:[])
    end

    def trash
        conversation.move_to_trash(@current_user)
        redirect_to mailbox_inbox_path
    end
    
    def untrash
        conversation.untrash(@current_user)
        redirect_to mailbox_inbox_path
    end

    private 

    def message_params 
        params.require(:message).permit(:body, :subject)
    end
    

end 