class CreatePractices < ActiveRecord::Migration[6.1]
  def change
    create_table :practices do |t|
      t.string :title
      t.datetime :start_time
      t.timestamps
      t.integer :time
      t.text :detail

      t.timestamps
    end
  end
end
