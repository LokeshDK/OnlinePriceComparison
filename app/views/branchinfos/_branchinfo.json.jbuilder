json.extract! branchinfo, :id, :branchname, :address, :phoneno, :branchincharge, :contactno, :storeinfo_id, :created_at, :updated_at
json.url branchinfo_url(branchinfo, format: :json)
