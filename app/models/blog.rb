class Blog < ApplicationRecord
  belongs_to :profile
  # each blog can have many attachments
  has_many :attachments , dependent: :destroy
end
