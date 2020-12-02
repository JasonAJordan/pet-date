class User < ApplicationRecord
    has_many :pets
    has_many_attached :pictures

    has_secure_password 

end
