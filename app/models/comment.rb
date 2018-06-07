class Comment < ApplicationRecord
  belongs_to :blog
  belongs_to :user
  # validate the presence of the comment body field
  validates :body, presence: true
end
