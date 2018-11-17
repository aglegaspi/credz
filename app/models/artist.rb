class Artist < ApplicationRecord
    validates :artist_name, uniqueness: { case_sensitive: false, artists_exists: "Hey btw this artists already exists!" }, length: { minimum: 2, maximum: 100 }

    has_many :artists_credits
    has_many :credits, through: :artists_credits
end
