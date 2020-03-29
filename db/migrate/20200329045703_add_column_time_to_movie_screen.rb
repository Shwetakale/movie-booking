class AddColumnTimeToMovieScreen < ActiveRecord::Migration[6.0]
  def change
    add_column :movie_screens, :start_time, :time
  end
end
