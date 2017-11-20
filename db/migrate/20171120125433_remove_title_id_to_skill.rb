class RemoveTitleIdToSkill < ActiveRecord::Migration[5.1]
  def change
    remove_column :ragnarok_skills, :title_id
  end
end
