class PetsController < ApplicationController

  skip_before_action :authorized, only: [:new, :create ]

    def index 
        @pets = Pet.all.with_attached_picture
           # might not need attached images bit 
           @locations = Location.all 
    end 
    
    def new
      @pet = Pet.new
      @users = User.all
    end
    
    def create
      pet = Pet.create(pet_params)
      pet.picture.attach(params[:pet][:picture])
         # might not need attached images bit 

      if pet.valid?
        redirect_to pet_path(pet)
      else
        flash[:errors] = pet.errors.full_messages
        redirect_to new_pet_path
      end
         
    end
      
    def show 
      @pet = Pet.find(params[:id])
      @meeting = Meeting.new
      @locations = Location.all 
      @requestieorder = @pet.requestie_relationships.order('status DESC')
      @requesterorder = @pet.requested_relationships.order('status DESC')

      cookies[:last_viewed_pet] = @pet.id
      
      if cookies[:view_count]
        cookies[:view_count] = cookies[:view_count].to_i + 1 
      else 
        cookies[:view_count] = 1 
      end 
    end 
      
    def browse 
      @pets = (Pet.all - @current_user.pets)
    end 

    def edit 
      @pet = Pet.find(params[:id])  

    end 
      
    def update 
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
      
      if @pet.valid?
      redirect_to pet_path(@pet)
      else 
      flash[:errors] = @pet.errors.full_messages
      redirect_to edit_pet_path
      end 
    end 
      
      
    def destroy 
      @pet = Pet.find(params[:id])
      @pet.destroy 
    
      redirect_to pets_path
    end 
    
    private

    def pet_params
        params.require(:pet).permit(:name, :age, :bio, :user_id, :picture)
    end
    
end
