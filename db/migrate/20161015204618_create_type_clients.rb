class CreateTypeClients < ActiveRecord::Migration[5.0]
  def change
    create_table :type_clients do |t|
      t.string :name

      t.timestamps
    end
  end
end
