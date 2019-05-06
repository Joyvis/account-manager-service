class AddInitialDepositToAccount < ActiveRecord::Migration[5.2]
  def change
    add_column :accounts, :initial_deposit, :float, null: false
  end
end
