class CuisineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :venue_id, :integer
  attribute :dish_id, :integer

  # Direct associations

  has_many :venues

  # Indirect associations

  has_many :best_dishes do
    assign_each do |cuisine, best_dishes|
      best_dishes.select do |b|
        b.id.in?(cuisine.best_dishes.map(&:id))
      end
    end
  end

  has_many :bookmarks do
    assign_each do |cuisine, bookmarks|
      bookmarks.select do |b|
        b.id.in?(cuisine.bookmarks.map(&:id))
      end
    end
  end
end
