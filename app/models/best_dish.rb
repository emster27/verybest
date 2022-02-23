class BestDish < ApplicationRecord
  # Direct associations

  belongs_to :venue

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user_id
  end

end
