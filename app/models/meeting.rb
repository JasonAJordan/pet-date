class Meeting < ApplicationRecord

    belongs_to :location

    belongs_to :requester, class_name: "Pet", foreign_key: :requester_id 
    belongs_to :requestie, class_name: "Pet", foreign_key: :requestie_id 
    
    # belongs_to :followed, class_name: "User", foreign_key: :followed_id
    # belongs_to :follower, class_name: "User", foreign_key: :follower_id


    def accept 
        self.status = 1
    end 

end
