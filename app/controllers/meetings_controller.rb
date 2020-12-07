class MeetingsController < ApplicationController

    #skip_before_action :authorized, only: [:new, :create ]

    def index 
        @meetings = Meeting.all.order('status DESC')


        @pet_id_list = @current_user.pets.map {|pet| pet.id }

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
    
        @user_messaging_list = @user_list_1 + @user_list_2 #+ [ @current_user ]
        @user_messaging_list.uniq! {|e| e[:id] }
    


    end 

    def show 
        @meeting = Meeting.find(params[:id])
        # .order('status DESC')
    end

    def new 
        @meeting = Meeting.new 
        @requesteds = (Pet.all - @current_user.pets) 
        @requesties = @current_user.pets  
        @locations = Location.all 
    end 

    def create 
        meeting = Meeting.create(meeting_params)
        if meeting.valid?
          redirect_to meeting_path(meeting)
        else
          flash[:errors] = meeting.errors.full_messages
          redirect_to new_meeting_path
        end
        
    end 

    def edit 
        @meeting = Meeting.find(params[:id])
    end 

    def update
        @meeting = Meeting.find(params[:id]) 
        @meeting.update(meeting_params)

        if @meeting.valid? 
            redirect_to meeting_path(@meeting)
        else 
            flash[:errors] = @meeting.errors.full_messages
            redirect_to edit_meeting_path
        end 
    end 

    def destroy 
        @meeting = Meeting.find(params[:id])
        @meeting.destroy 
      
        redirect_to meetings_path
    end 


    private 

    def meeting_params 
        params[:status] = 'Requested'
        params.require(:meeting).permit(:time, :status, :requester_id, :requestie_id, :location_id)
    end 

end
