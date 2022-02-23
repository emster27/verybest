class BestDishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :venue_id, :integer
  attribute :bookmark_count, :integer

  # Direct associations

  # Indirect associations

end
