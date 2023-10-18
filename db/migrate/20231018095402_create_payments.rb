class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :povider
      t.string :status
      t.string :ref
      t.float :amount

      t.timestamps
    end
  end
end
