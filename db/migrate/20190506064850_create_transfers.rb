class CreateTransfers < ActiveRecord::Migration[5.2]
  def change
    create_table :transfers do |t|
      t.references :source_account, foreign_key: { to_table: :accounts }, null: false
      t.references :destination_account, foreign_key: { to_table: :accounts }, null: false
      t.decimal :amount, null: false
      t.timestamps
    end
  end
end
