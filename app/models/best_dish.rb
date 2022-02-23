class BestDish < ApplicationRecord
  # Direct associations

  has_many   :bookmarks,
             :foreign_key => "dish_id",
             :dependent => :destroy

  belongs_to :venue

  # Indirect associations

  has_one    :cuisine,
             :through => :venue,
             :source => :cuisine

  # Validations

  # Scopes

  def to_s
    user_id
  end

end
