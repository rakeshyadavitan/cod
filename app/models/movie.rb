class Movie < ApplicationRecord

  include Purchaseable

  validates_presence_of :title, :plot

  scope :recent, -> {order(:created_at)}
end
