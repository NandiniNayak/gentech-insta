class Product < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  mount_uploader :picture, PostPictureUploader

  def self.search(search)
      where("name LIKE ? ", "#{search}")  #this is case insensitive
      # where(name: search)      # this is case sensitive
  end
end
