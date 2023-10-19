class ChangePriceToFloatAndAddQuantityToProducts < ActiveRecord::Migration[7.0]
  def change
    change_column :products, :price, :float
    add_column :products, :quantity, :integer
  end
end
