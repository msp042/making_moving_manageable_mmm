class Box < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :category

  has_many   :items,
             dependent: :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end
end
