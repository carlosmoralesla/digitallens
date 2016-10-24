json.extract! sale, :id, :lent_serial_id, :quantity, :price_sale, :created_at, :updated_at
json.url sale_url(sale, format: :json)