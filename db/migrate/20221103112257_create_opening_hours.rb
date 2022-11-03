class CreateOpeningHours < ActiveRecord::Migration[7.0]
  def change
    create_table :opening_hours do |t|
      t.references :shop, foreign_key: true
      t.integer :day, null: false
      t.time :opens_at, null: false
      t.time :closes_at, null: false
      t.timestamps
    end
  end
end