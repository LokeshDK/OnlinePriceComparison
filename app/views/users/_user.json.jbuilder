json.extract! user, :id, :title, :firstname, :lastname, :email, :phone, :password, :created_at, :updated_at
json.url user_url(user, format: :json)
