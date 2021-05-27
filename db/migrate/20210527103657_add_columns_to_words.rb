class AddColumnsToWords < ActiveRecord::Migration[5.2]
  def change
    add_reference :words, :genre, null: false, foreign_key: true, default: 0
  end
end
