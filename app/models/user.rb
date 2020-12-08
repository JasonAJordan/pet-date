class User < ApplicationRecord
    has_one_attached :picture
    has_many :pets, dependent: :destroy

    acts_as_messageable

    has_secure_password 
    
    # validates :picture, presence: true 
    validates :name, presence: true 
    validates :bio, presence: true

    validates :user_name, presence: true 
    validates :user_name, uniqueness: true 


    def mailboxer_name 
        self.name 
    end 

    def mailboxer_email(object)
        self.email 
    end 
end
