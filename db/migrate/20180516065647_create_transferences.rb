class CreateTransferences < ActiveRecord::Migration[5.2]
  def change
    create_table :transferences do |t|
      t.float :amount
      t.references :account, foreign_key: true
      t.integer :receiver_account_id, limit: 5

      t.timestamps
    end

    add_foreign_key(:transferences, :accounts, column: :receiver_account_id)
  end
end
