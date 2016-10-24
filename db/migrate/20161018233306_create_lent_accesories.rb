class CreateLentAccesories < ActiveRecord::Migration[5.0]
  def change
    create_table :lent_accesories do |t|
      t.string :name
      t.decimal :price_cost, :precision => 8, :scale => 2
      t.decimal :price_shop, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
