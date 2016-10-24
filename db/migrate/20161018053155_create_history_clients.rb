class CreateHistoryClients < ActiveRecord::Migration[5.0]
  def change
    create_table :history_clients do |t|
      t.integer :client_id
      t.date :date_consult 
      t.string :num_consult     
      t.string :anamnesis

      t.string :past_eye_left
      t.string :past_eye_right
      t.integer :past_lent_type_id

      t.string :current_eye_left
      t.string :current_eye_right
      t.integer :current_lent_type_id  

      t.string :add_near    
      t.string :add_intermedium
      t.string :add_alt
      
      t.string :result_info
      t.string :recommend_info

      t.timestamps
    end
  end
end

