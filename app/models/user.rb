class User < ApplicationRecord
    has_many :pets
    has_one_attached :picture

    has_secure_password 
    
    #validates :picture, presence: true 
    validates :name, presence: true 
    validates :bio, presence: true


    
    validates :user_name, presence: true 
    validates :user_name, uniqueness: true 

end
