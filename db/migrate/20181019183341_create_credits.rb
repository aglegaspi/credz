class CreateCredits < ActiveRecord::Migration[5.2]
  def change
    create_table :credits do |t|
      t.string :song_title
      t.string :mix_version
      t.references :artist, foreign_key: true

      t.timestamps
    end
  end
end
