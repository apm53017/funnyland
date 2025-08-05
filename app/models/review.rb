class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :profile_image
  
end
