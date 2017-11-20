class CreateRagnarokTitleSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_title_skills do |t|
      t.integer :title_id, null: false
      t.integer :skill_id, null: false
      t.integer :point

      t.timestamps
    end
  end
end
