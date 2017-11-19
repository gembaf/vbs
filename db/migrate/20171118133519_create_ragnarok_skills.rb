class CreateRagnarokSkills < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_skills do |t|
      t.string  :name, null: false
      t.integer :point, defalut: 0
      t.integer :title_id

      t.timestamps
    end
  end
end
