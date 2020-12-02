class Pet < ApplicationRecord
    has_many :requested_relationships, class_name: "Meeting", foreign_key: :requester_id, dependent: :destroy 
    has_many :requesteds, through: :requested_relationships, source: :requested
    
    has_many :requestie_relationships, class_name: "Meeting", foreign_key: :requestie_id, dependent: :destroy 
    has_many :requesties, through: :requestie_relationships, source: :requestie 
    has_many_attached :pictures

    #has_many :meetings

    belongs_to :user

    
    # has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    # has_many :followees, through: :followed_users
    
    # has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    # has_many :followers, through: :following_users

    # has_many :active_relationships, class_name: "Relationship", foreign_key: :follower_id, dependent: :destroy
    # has_many :followeds, through: :active_relationships, source: :followed
    
    # has_many :passive_relationships, class_name: "Relationship", foreign_key: :followed_id, dependent: :destroy
    # has_many :followers, through: :passive_relationships, source: :follower
    
end
