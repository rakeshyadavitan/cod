class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :purchaseable, polymorphic: true

  validates_uniqueness_of :user, scope: :purchaseable
  validates_presence_of :user, :purchaseable, :video_quality
  validates :price, numericality: { greater_than_or_equal_to: 0 }, presence: true

  # scope :alive, -> { where(is_expired: false) }

end
