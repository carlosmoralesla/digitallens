class CreateLentSerials < ActiveRecord::Migration[5.0]
  def change
    create_table :lent_serials do |t|
      t.integer :lent_kind_id
      t.integer :lent_model_id
      t.integer :lent_color_id
      t.string :name
      t.decimal :price_cost, :precision => 8, :scale => 2
      t.decimal :price_shop, :precision => 8, :scale => 2
 

      t.timestamps
    end
  end
end
