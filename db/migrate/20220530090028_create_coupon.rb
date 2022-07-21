class CreateCoupon < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :type
      t.float :price
      t.float :percent
      t.string :coupon_code
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
