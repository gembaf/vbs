class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_items do |t|
      t.string  :name,         null: false
      t.string  :type,         null: false
      t.integer :rare,         null: false
      t.integer :attack,       null: false, default: 0
      t.integer :defense,      null: false, default: 0
      t.integer :speed,        null: false, default: 0
      t.integer :intelligence, null: false, default: 0

      t.timestamps
    end
  end
end
