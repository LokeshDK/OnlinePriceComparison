json.extract! review, :id, :comment, :rating, :user_id, :productinfo_id, :created_at, :updated_at
json.url review_url(review, format: :json)
