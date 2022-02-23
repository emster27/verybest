class Venue < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :best_dishes,
             :dependent => :destroy

  has_many   :bookmarks,
             :dependent => :destroy

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    state
  end

end
