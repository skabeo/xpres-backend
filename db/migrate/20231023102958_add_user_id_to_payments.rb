class AddUserIdToPayments < ActiveRecord::Migration[7.0]
  def change
    add_reference :payments, :user, foreign_key: true, default: 1
  end
end
