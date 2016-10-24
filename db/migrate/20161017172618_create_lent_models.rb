class CreateLentModels < ActiveRecord::Migration[5.0]
  def change
    create_table :lent_models do |t|
      t.string :name
      t.integer :lent_mark_id

      t.timestamps
    end
  end
end
