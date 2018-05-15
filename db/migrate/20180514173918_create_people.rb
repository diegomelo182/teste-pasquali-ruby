class CreatePeople < ActiveRecord::Migration[5.2]
  def change
    create_table :people do |t|
      t.string :cpf_cnpj
      t.text :business_name
      t.text :name
      t.date :bday
      t.integer :kind

      t.timestamps
    end
  end
end
