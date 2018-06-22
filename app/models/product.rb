class Product < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  mount_uploader :picture, PostPictureUploader
end
