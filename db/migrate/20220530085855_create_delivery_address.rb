class CreateDeliveryAddress < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_addresses do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
