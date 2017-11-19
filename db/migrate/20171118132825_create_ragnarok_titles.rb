class CreateRagnarokTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_titles do |t|
      t.string  :name,         null: false
      t.boolean :prefix,       null: false, default: false
      t.boolean :suffix,       null: false, default: false
      t.integer :attack,       null: false, default: 0
      t.integer :defense,      null: false, default: 0
      t.integer :speed,        null: false, default: 0
      t.integer :intelligence, null: false, default: 0
      t.string  :specialty,    null: false, default: ''
      t.string  :protection,   null: false, default: ''

      t.timestamps
    end
  end
end
