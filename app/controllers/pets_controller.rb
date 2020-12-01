class PetsController < ApplicationController

    def index 
        @pets = Pet.all
    end 
    
    def new
      @pet = Pet.new
    end
    
    def create
      pet = Pet.create(pet_params)

      if pet.valid?
        redirect_to pet_path(pet)
      else
        flash[:my_errors] = pet.errors.full_messages
        redirect_to new_pet_path
      end
         
    end
      
    def show 
      @pet = Pet.find(params[:id])

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
      flash[:my_errors] = @pet.errors.full_messages
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
        params.require(:pet).permit(:name, :age, :bio)
    end
    
end
