class LocationsController < ApplicationController

    skip_before_action :authorized, only: [:new, :create, :index]

    def index 
        @locations = Location.all 
    end 

    def show 
        @location = Location.find(params[:id])
    end 

    def edit 
        @location = Location.find(params[:id])
    end 

    def new 
        @location = Location.new 
    end 

    def create 
        location = Location.create(location_params)
        location.picture.attach(params[:location][:picture])

        if location.valid?
        #   redirect_to location_path(location)
          redirect_to browse_path
        else
          flash[:errors] = location.errors.full_messages
          redirect_to new_location_path
        end
    end

    def update 
        @location = Location.find(params[:id])
        @location.update(location_params)
            if @location.valid?
            redirect_to location_path(@location)
            else 
            flash[:my_errors] = location.errors.full_messages
            redirect_to new_location_path
        end 
    end 
 
    def destroy 
        @location = Location.find(params[:id])
        @location.destroy 
        redirect_to locations_path 
    end 

    private

    def location_params 
        params.require(:location).permit(:name, :picture, :neighbourhood)
    end
end
