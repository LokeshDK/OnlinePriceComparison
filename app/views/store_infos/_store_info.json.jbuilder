json.extract! store_info, :id, :store_name, :address, :phone_no, :buisness_id, :branches, :store_incharge, :contact_no, :created_at, :updated_at
json.url store_info_url(store_info, format: :json)
