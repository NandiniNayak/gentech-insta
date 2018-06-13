class Following < ApplicationRecord
  # belongs_to :user
  # distiguish between follower and followee
  # follower: who follows my profile
  # folowee :profiles that I follow
  belongs_to :follower, class_name: 'User', foreign_key: 'user_id'
  belongs_to :followee, class_name: 'User', foreign_key: 'follower_id'
end
