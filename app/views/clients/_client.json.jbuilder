json.extract! client, :id, :type_doc_id, :num_doc, :name, :last_name, :second_surname, :age, :sex,:address, :created_at, :updated_at
json.url client_url(client, format: :json)