class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :last_name
      t.string :second_surname

      t.timestamps
    end
  end
end
