class CreateBatches < ActiveRecord::Migration[7.0]
  def change
    create_table :batches do |t|
      t.integer :batch_number
      t.date :start_date
      t.date :end_date
      t.float :shipping_cost

      t.timestamps
    end
  end
end
