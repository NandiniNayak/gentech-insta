class Profile < ApplicationRecord
  belongs_to :user
  has_many :posts
  # each profile can upload multiple blogs
  has_many :blogs
  mount_uploader :picture, AvatarUploader
end
