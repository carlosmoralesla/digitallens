class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.integer :type_doc_id
      t.string  :num_doc
      t.string  :name
      t.string  :last_name
      t.string  :second_surname
      t.integer :age
      t.integer :sex
      t.string  :address
      t.string  :company_name

      t.timestamps
    end
  end
end
