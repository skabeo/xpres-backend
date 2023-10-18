class RenamePoviderToProviderInPayments < ActiveRecord::Migration[7.0]
  def change
    rename_column :payments, :povider, :provider
  end
end
