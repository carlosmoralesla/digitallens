class CreateSuppliers < ActiveRecord::Migration[5.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :num_doc
      t.integer :type_doc_id

      t.timestamps
    end
  end
end
