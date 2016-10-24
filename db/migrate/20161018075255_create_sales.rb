class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :client_id 	
      t.string :num_sale

      t.timestamps
    end
  end
end
