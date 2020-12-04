class UsersController < ApplicationController

  skip_before_action :authorized, only: [:new, :create, :index]
  before_action :user_authorized, only: [:update]

  def user_authorized 
    redirect_to user_path(cookies[:edit_page]) unless cookies[:user_id] == cookies[:edit_page]
  end 

    def index 
        @users = User.all.with_attached_picture
        # might not need attached images bit 
    end 
    
    def new
      @user = User.new
    end
    
    def create
      user = User.create(user_params)
      user.picture.attach(params[:user][:picture])
      if user.valid?
        cookies[:user_id] = user.id
        redirect_to users_path
      else
        flash[:errors] = user.errors.full_messages
        redirect_to new_user_path
      end
         
    end
      
    def show 
      @user = User.find(params[:id])
      @pets = @user.pets 

      # @requestieorder = @pet.requestie_relationships.order('status DESC')
      # @requesterorder = @pet.requested_relationships.order('status DESC')

    end 
      
    def edit 
      @user = User.find(params[:id])  
      cookies[:edit_page] = @user.id
    end 
      
    def update 
    @user = User.find(params[:id])
    @user.update(user_params)
      
      if @user.valid?
      # cookies[:user_id] = @user.id # might not need this line
      redirect_to user_path(@user)
      else 
      flash[:errors] = @user.errors.full_messages
      redirect_to edit_user_path
      end 
    end 
      
      
    def destroy 
      @user = User.find(params[:id])
      @user.destroy 
    
      redirect_to users_path
    end 
    
    private

    def user_params
        params.require(:user).permit(:name, :bio, :password, :user_name, :pictures, :location, :hobbies, :favorite )
    end
    
end
