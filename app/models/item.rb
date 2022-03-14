class Item < ApplicationRecord
  # Direct associations

  belongs_to :box

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    box.to_s
  end

end
