# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.integer :member_id
      t.integer :word_id

      t.timestamps
    end
  end
end
