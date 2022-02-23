class VenueResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :state, :string
  attribute :city, :string
  attribute :neighborhood, :string
  attribute :cuisine_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :cuisine

  has_many   :best_dishes

  has_many   :bookmarks

  belongs_to :user

  # Indirect associations

end
