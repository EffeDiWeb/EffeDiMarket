class AddAmountToSales < ActiveRecord::Migration[5.1]
  def change
    add_column :sales, :amout, :integer
  end
end
