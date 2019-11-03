json.extract! storeinfo, :id, :storename, :address, :phoneno, :buisnessid, :branchcount, :storeincharge, :contactno, :image, :created_at, :updated_at
json.url storeinfo_url(storeinfo, format: :json)
