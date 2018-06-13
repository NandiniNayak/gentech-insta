class Blog < ApplicationRecord
  belongs_to :profile
  # each blog can have many attachments
  has_many :attachments , dependent: :destroy
  has_many :comments, dependent: :destroy
  validates :status, presence: true
  acts_as_votable
end
