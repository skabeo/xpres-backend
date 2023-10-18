class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.references :category, null: false, foreign_key: true
      t.references :batch, null: false, foreign_key: true
      t.text :name
      t.text :description
      t.string :brand
      t.float :weight_kg
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
