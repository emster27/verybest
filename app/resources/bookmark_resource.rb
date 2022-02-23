class BookmarkResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :user_id, :integer
  attribute :venue_id, :integer
  attribute :notes, :string
  attribute :dish_id, :integer

  # Direct associations

  belongs_to :dish,
             resource: BestDishResource

  belongs_to :venue

  belongs_to :user

  # Indirect associations

  has_one    :food_type,
             resource: CuisineResource

  filter :cuisine_id, :integer do
    eq do |scope, value|
      scope.eager_load(:food_type).where(venues: { cuisine_id: value })
    end
  end
end
