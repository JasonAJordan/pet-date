class MeetingsController < ApplicationController

    def new 
        @meeting = Meeting.new 
    end 

    def create 
        meeting = Meeting.create(meeting_params)

        redirect_to meeting_path(meeting)
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
            flash[:my_errors] = @meeting.errors.full_messages
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
        params.require(:meeting).permit(:time, :status, :requester_id, :requestie_id)
    end 

end
