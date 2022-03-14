class User < ApplicationRecord
  # Direct associations

  has_many   :boxes,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    name
  end

end
