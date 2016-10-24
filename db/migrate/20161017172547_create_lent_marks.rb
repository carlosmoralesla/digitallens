class CreateLentMarks < ActiveRecord::Migration[5.0]
  def change
    create_table :lent_marks do |t|
      t.string :name

      t.timestamps
    end
  end
end
