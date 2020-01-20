class Movie < ApplicationRecord

  validates_presence_of :title, :plot

  scope :recent, -> {order(:created_at)}
end
