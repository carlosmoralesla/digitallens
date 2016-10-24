class CreateAccesorySales < ActiveRecord::Migration[5.0]
  def change
    create_table :accesory_sales do |t|
      t.integer :sale_id
      t.integer :lent_accesory_id
      
      t.integer :quantity
      t.decimal :price_sale , :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
