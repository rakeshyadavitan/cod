class Season < ApplicationRecord

  include Purchaseable

  has_many :episodes, dependent: :destroy

  validates_presence_of :title, :plot
  validates :number, numericality: { greater_than_or_equal_to: 0 }, presence: true

  scope :recent, -> {order(:created_at)}
end
