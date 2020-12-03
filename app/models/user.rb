class User < ApplicationRecord
    has_many :pets
    has_one_attached :picture

    has_secure_password 

end
