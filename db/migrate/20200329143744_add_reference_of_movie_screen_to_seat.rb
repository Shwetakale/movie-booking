class AddReferenceOfMovieScreenToSeat < ActiveRecord::Migration[6.0]
  def change
    add_reference :seats, :movie_screen, null: false, foreign_key: true
  end
end
