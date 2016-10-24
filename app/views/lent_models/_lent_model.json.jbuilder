json.extract! lent_model, :id, :name, :lent_mark_id, :created_at, :updated_at
json.url lent_model_url(lent_model, format: :json)