class CreateMedallions < ActiveRecord::Migration[5.1]
  def change
    create_table :ragnarok_medallions do |t|
      t.string :short_name, null: false
      t.string :name, null: false
      t.integer :reality, null: false
      t.integer :resource, null: false
      t.integer :cost, null: false

      t.timestamps
    end
  end
end
