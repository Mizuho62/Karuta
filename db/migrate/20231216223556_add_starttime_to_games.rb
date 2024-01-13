class AddStarttimeToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :start_time, :time
  end
end
