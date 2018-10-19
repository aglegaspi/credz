class ArtistsCredit < ApplicationRecord
    belongs_to :artist
    belongs_to :credit
  end
  