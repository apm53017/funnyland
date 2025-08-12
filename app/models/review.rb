class Review < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_one_attached :profile_image

  validates :review, presence: true, inclusion: { in: 1..5 }
  validates :comment, length: { maximum: 500 }

  before_validation :review_or_comment_presence_check

  private

  def review_or_comment_presence_check
    review_into_zero
    if self.review == 0 && !self.comment.present?
      errors.add(:base,  "評価かコメントいずれかの入力が必須です")
    end
  end

  def review_into_zero
    self.review = 0 unless self.review.present?
  end
end