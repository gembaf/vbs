class CreateRagnarokUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_units do |t|
      t.string  :name,         null: false
      t.string  :type,         null: false
      t.string  :protection,   null: false
      t.string  :profession,   null: false
      t.integer :hp,           null: false
      t.integer :attack,       null: false
      t.integer :defense,      null: false
      t.integer :speed,        null: false
      t.integer :intelligence, null: false
      t.string  :tribe,        null: false
      t.string  :specialty,    null: false
      t.string  :item1,        null: false
      t.string  :item2,        null: false
      t.integer :rank,         null: false, default: 1
      t.integer :cost,         null: false, default: 1

      t.timestamps
    end
  end
end
