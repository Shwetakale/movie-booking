class RemoveColumnDateFromMovieScreen < ActiveRecord::Migration[6.0]
  def change

    remove_column :movie_screens, :date, :date
  end
end
