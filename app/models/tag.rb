class Tag < ApplicationRecord

  has_many :post_tags, dependent: :destroy

  has_one_attached :tag_image

  def get_tag_image(width, height)
    unless tag_image.attached?
      file_path = Rails.root.join('app/assets/images/sample-author1.jpg')
      tag_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    tag_image.variant(resize_to_limit: [width, height]).processed
  end
end