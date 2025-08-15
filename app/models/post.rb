class Post < ApplicationRecord
  belongs_to :user
  #belongs_to :tag

  has_many :reviews, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags

  has_one_attached :post_image
  has_one_attached :profile_image

  validates :title, presence: true
  validates :body, presence: true
  validates :address, presence: true
  validates :telephone_number, presence: true
  validates :opening_times, presence: true
  validates :closed_day, presence: true
  #validates :latitude, presence: true
  #validates :longitude, presence: true
  validates :post_image, presence: true

  geocoded_by :address
  after_validation :geocode

  def get_post_image(width, height)
    unless post_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      post_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    post_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(title: content)
    elsif method == 'forward'
      Post.where('title LIKE ?', content+'%')
    elsif method == 'backward'
      Post.where('title LIKE ?', '%'+content)
    else
      Post.where('title LIKE ?', '%'+content+'%')
    end
  end

end
