class LocationsController < ApplicationController

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

        if Location.valid?
          redirect_to location_path(location)
        else
          flash[:my_errors] = location.errors.full_messages
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
        params.permit(:location).require(:name)
    end
end