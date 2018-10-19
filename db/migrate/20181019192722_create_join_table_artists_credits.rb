class CreateJoinTableArtistsCredits < ActiveRecord::Migration[5.2]
  def change
    create_join_table :artists, :credits do |t|
      t.references :artist, foreign_key: true
      t.references :credit, foreign_key: true
    end
  end
end
