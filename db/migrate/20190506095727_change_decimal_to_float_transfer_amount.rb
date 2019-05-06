class ChangeDecimalToFloatTransferAmount < ActiveRecord::Migration[5.2]
  def change
    remove_column :transfers, :amount
    add_column :transfers, :amount, :float
  end
end
