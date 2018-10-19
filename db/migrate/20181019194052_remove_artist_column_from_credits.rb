class RemoveArtistColumnFromCredits < ActiveRecord::Migration[5.2]
  def change
    remove_column :credits, :artist_id
  end
end
