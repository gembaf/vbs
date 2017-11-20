class RemoveTitleIdToSkill < ActiveRecord::Migration[5.1]
  def change
    remove_column :ragnarok_skills, :title_id, :integer, null: false
    remove_column :ragnarok_skills, :point, :integer
  end
end
