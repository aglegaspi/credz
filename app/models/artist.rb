class Artist < ApplicationRecord
    has_many :artists_credits
    has_many :credits, through: :artists_credits
end
