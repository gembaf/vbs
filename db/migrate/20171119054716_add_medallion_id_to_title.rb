class AddMedallionIdToTitle < ActiveRecord::Migration[5.1]
  def change
    add_column :ragnarok_titles, :medallion_id, :integer, null: false
  end
end
