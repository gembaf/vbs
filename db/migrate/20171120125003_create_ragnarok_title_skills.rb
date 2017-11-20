class CreateRagnarokTitleSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_title_skills do |t|
      t.integer :title_id
      t.integer :skill_id
      t.integer :point

      t.timestamps
    end
  end
end
