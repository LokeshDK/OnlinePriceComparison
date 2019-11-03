json.extract! productinfo, :id, :productname, :storeproductid, :productprice, :branchinfo_id, :image, :categorie_id, :created_at, :updated_at
json.url productinfo_url(productinfo, format: :json)
