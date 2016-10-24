class CreateInfoSales < ActiveRecord::Migration[5.0]
  def change
    create_table :info_sales do |t|
      t.integer :sale_id
      
      t.integer :quantity
      t.integer :lent_serial_id
      t.decimal :price_sale, :precision => 8, :scale => 2


      t.timestamps
    end
  end
end
