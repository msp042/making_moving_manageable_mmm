class Box < ApplicationRecord
  # Direct associations

  has_many   :items,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    user.to_s
  end

end
