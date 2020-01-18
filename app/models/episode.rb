class Episode < ApplicationRecord
  belongs_to :season
  validates_presence_of :title, :plot, :number
end
