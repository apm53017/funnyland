class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :profile_image

  validates :review, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 500 }
  
end
