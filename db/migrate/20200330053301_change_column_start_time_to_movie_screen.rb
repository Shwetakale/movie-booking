class ChangeColumnStartTimeToMovieScreen < ActiveRecord::Migration[6.0]
  def change
    remove_column :movie_screens, :start_time, :time
    add_column :movie_screens, :start_time, :datetime
  end
end
