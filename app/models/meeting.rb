class Meeting < ApplicationRecord

    belongs_to :location

    belongs_to :requester, class_name: "Pet", foreign_key: :requester_id 
    belongs_to :requestie, class_name: "Pet", foreign_key: :requestie_id 
    
    # belongs_to :followed, class_name: "User", foreign_key: :followed_id
    # belongs_to :follower, class_name: "User", foreign_key: :follower_id


    def accept 
        self.status = "Accepted"
    end 

    def current_date 
        time1 = Time.new.utc
    end 

    def has_passed
        if self.time 
            if self.time < self.current_date
                return "I hope you had fun"
            else 
                return "Your date is soon!" 
            end
        else 
            "Something went wrong"
        end
    end 

    def time_nice 
        if self.time 
            time.strftime("%A, %m/%d/%Y at  %I:%M%p")
        else 
            "Something went wrong"
        end
    end 

end
