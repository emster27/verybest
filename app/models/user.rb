class User < ApplicationRecord
  # Direct associations

  has_many   :venues,
             dependent: :destroy

  has_many   :bookmarks,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    email
  end
end
