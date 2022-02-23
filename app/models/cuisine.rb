class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :venues,
             :dependent => :destroy

  # Indirect associations

  has_many   :bookmarks,
             :through => :venues,
             :source => :bookmarks

  # Validations

  # Scopes

  def to_s
    venue_id
  end

end
