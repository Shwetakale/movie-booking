class AddReferenceOfMovieScreenToReservation < ActiveRecord::Migration[6.0]
  def change
    add_reference :reservations, :movie_screen, null: false, foreign_key: true
  end
end
