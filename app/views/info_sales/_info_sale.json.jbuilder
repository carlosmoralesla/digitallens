json.extract! info_sale, :id, :quantity, :price_sale, :lent_serial_id, :created_at, :updated_at
json.url info_sale_url(info_sale, format: :json)