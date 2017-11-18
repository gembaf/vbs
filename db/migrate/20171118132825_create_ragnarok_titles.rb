class CreateRagnarokTitles < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_titles do |t|
      t.string :name, null: false
      t.boolean :prefix, null: false
      t.boolean :suffix, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.integer :speed, null: false
      t.integer :intelligence, null: false
      t.string :specialty, null: false
      t.string :protection, null: false
      t.integer :skill_id, null: false

      t.timestamps
    end
  end
end
