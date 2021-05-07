class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.integer :member_id, null: false
      t.integer :genre_id,  null: false
      t.text    :sentence,  null: false

      t.timestamps
    end
  end
end
