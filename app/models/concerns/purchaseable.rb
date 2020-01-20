module Purchaseable
  extend ActiveSupport::Concern

  included do
    has_many :purchases, as: :purchaseable
  end
end