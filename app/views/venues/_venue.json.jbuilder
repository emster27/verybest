json.extract! venue, :id, :state, :city, :neighborhood, :cuisine_id, :user_id,
              :created_at, :updated_at
json.url venue_url(venue, format: :json)
