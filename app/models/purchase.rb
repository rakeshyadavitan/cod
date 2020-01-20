class Purchase < ApplicationRecord

  belongs_to :user
  belongs_to :purchaseable, polymorphic: true

  validates_uniqueness_of :user, scope: :purchaseable
end
