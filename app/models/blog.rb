class Blog < ApplicationRecord
  belongs_to :profile
  has_many :attachments
  mount_uploader :picture, PostPictureUploader
end
