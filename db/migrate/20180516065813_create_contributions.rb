class CreateContributions < ActiveRecord::Migration[5.2]
  def change
    create_table :contributions do |t|
      t.float :amount
      t.references :account, foreign_key: true

      t.timestamps
    end
  end
end
