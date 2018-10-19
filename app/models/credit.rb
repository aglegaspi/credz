class Credit < ApplicationRecord
  has_many :artists_credits
  has_many :artists, through: :artists_credits
end
