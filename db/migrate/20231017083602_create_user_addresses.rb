class CreateUserAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :user_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :address
      t.string :city
      t.string :tel_line
      t.string :tel_line2

      t.timestamps
    end
  end
end
