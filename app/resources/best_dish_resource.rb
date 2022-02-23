class BestDishResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :venue_id, :integer
  attribute :bookmark_count, :integer

  # Direct associations

  has_many   :bookmarks,
             foreign_key: :dish_id

  belongs_to :venue

  # Indirect associations

  has_one    :cuisine

  filter :cuisine_id, :integer do
    eq do |scope, value|
      scope.eager_load(:cuisine).where(venues: { cuisine_id: value })
    end
  end
end
