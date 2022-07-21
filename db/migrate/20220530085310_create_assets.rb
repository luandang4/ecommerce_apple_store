class CreateAssets < ActiveRecord::Migration[6.1]
  def change
    create_table :assets do |t|
      t.string :file_name
      t.string :type
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
