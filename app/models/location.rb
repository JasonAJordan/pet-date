class Location < ApplicationRecord
    has_many :meetings
    has_one_attached :picture

    validates :name, presence: true 
    
end
