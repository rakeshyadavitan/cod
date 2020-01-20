class Episode < ApplicationRecord
  belongs_to :season
  validates_presence_of :title, :plot
  validates :number, numericality: { greater_than_or_equal_to: 0 }, presence: true
end
