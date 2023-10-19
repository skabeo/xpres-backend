class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :payment, null: false, foreign_key: true
      t.integer :quantity
      t.float :total

      t.timestamps
    end
  end
end
