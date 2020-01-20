class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.references :user, foreign_key: true
      t.decimal :price
      t.string :video_quality
      t.boolean :is_expired, default: false

      t.timestamps
    end
  end
end
