json.extract! bookmark, :id, :user_id, :venue_id, :notes, :dish_id, :created_at, :updated_at
json.url bookmark_url(bookmark, format: :json)