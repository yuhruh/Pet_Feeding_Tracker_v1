class CreatePetTrackers < ActiveRecord::Migration[8.0]
  def change
    create_table :pet_trackers do |t|
      t.date :date, default: -> { 'CURRENT_DATE' }
      t.time :time, default: -> { 'CURRENT_TIME' }
      t.string :brand
      t.string :description
      t.decimal :wet_amount, precision: 5, scale: 2
      t.decimal :wet_left_amount, precision: 5, scale: 2
      t.decimal :dry_amount, precision: 5, scale: 2
      t.decimal :dry_left_amount, precision: 5, scale: 2

      t.timestamps
    end
  end
end
