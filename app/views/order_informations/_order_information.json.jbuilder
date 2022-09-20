json.extract! order_information, :id, :order_id, :status, :created_at, :updated_at
json.url order_information_url(order_information, format: :json)
