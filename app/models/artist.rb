class Artist < ApplicationRecord
    validates :artist_name, uniqueness: { case_sensitive: false }

    has_many :artists_credits
    has_many :credits, through: :artists_credits
end
