class CreateTypeDocs < ActiveRecord::Migration[5.0]
  def change
    create_table :type_docs do |t|
      t.integer :type_client_id
      t.string :name

      t.timestamps
    end
  end
end
