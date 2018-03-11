class AddAmountToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :amount, :integer, default: 0, null: false
  end
end
