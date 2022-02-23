class CuisineResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :venue_id, :integer
  attribute :dish_id, :integer

  # Direct associations

  has_many   :venues

  # Indirect associations

  has_many :bookmarks do
    assign_each do |cuisine, bookmarks|
      bookmarks.select do |b|
        b.id.in?(cuisine.bookmarks.map(&:id))
      end
    end
  end

end
