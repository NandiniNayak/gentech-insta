class Attachment < ApplicationRecord
  belongs_to :blog
  mount_uploader :image, PostPictureUploader
end
