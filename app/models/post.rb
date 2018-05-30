class Post < ApplicationRecord
  belongs_to :profile
  mount_uploader :picture, PostPictureUploader
end
