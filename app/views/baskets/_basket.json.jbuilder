json.extract! basket, :id, :name, :status, :user_id, :created_at, :updated_at
json.url basket_url(basket, format: :json)
