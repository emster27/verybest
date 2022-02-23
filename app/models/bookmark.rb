class Bookmark < ApplicationRecord
  # Direct associations

  belongs_to :dish,
             :class_name => "BestDish"

  belongs_to :venue

  belongs_to :user

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
