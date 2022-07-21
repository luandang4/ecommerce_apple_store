class CreateRecentlyProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :recently_products do |t|
      t.string :token
      t.integer :user_id
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
