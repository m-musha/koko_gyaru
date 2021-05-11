class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.references :member
      t.text    :sentence,  null: false

      t.timestamps
    end
  end
end
