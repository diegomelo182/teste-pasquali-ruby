class CreateAccounts < ActiveRecord::Migration[5.2]
  def change
    create_table :accounts do |t|
      t.text :name
      t.float :balance
      t.integer :kind
      t.integer :status
      t.integer :parent_account_id
      t.references :person, foreign_key: true

      t.timestamps
    end

    add_index(:accounts, :parent_account_id)
  end
end
