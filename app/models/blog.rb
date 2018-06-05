class Blog < ApplicationRecord
  belongs_to :profile
  # each blog can have many attachments
  has_many :attachments , dependent: :destroy
  validates :status, presence: true
  acts_as_votable
end
