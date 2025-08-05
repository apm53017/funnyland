class Post < ApplicationRecord
  belongs_to :user

  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy

  has_one_attached :post_image
  has_one_attached :profile_image

  validates :title, presence: true
  validates :body, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :opening_times, presence: true
  validates :closed_day, presence: true
  validates :latitude, presence: true
  validates :longitude, presence: true
  validates :post_image, presence: true

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end
end
