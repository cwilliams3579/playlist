class CreateSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :selections do |t|
      t.references :user, foreign_key: true
      t.references :song, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
