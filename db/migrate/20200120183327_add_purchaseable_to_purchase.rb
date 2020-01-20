class AddPurchaseableToPurchase < ActiveRecord::Migration[5.2]
  def change
    add_reference :purchases, :purchaseable, polymorphic: true
  end
end
