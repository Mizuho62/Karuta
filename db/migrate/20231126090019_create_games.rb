class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.datetime :start_time
      t.timestamps
      t.string :level
      t.string :hand
      t.string :result
      t.integer :count
      t.text :about

      t.timestamps
    end
  end
end
