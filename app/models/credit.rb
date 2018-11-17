class Credit < ApplicationRecord
  validates :song_title, presence: true

  has_many :artists_credits
  has_many :artists, through: :artists_credits
end
