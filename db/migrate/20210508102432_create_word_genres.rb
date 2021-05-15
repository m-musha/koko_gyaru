class CreateWordGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :word_genres do |t|
      t.references :word
      t.references :genre

      t.timestamps
    end
  end
end
