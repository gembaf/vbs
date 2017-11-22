class CreateItemSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_item_skills do |t|
      t.integer :item_id,  null: false
      t.integer :skill_id, null: false
      t.integer :point

      t.timestamps
    end
  end
end
