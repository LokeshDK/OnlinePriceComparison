json.extract! profile, :id, :title, :firstname, :lastname, :address, :phoneno, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
