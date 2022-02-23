json.extract! best_dish, :id, :user_id, :venue_id, :bookmark_count,
              :created_at, :updated_at
json.url best_dish_url(best_dish, format: :json)
