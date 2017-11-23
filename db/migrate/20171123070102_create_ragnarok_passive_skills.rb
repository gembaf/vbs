class CreateRagnarokPassiveSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_passive_skills do |t|
      t.integer :unit_id,  null: false
      t.integer :skill_id, null: false
      t.integer :point

      t.timestamps
    end
  end
end
