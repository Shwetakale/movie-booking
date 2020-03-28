class CreateMovieScreens < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_screens do |t|
      t.references :screen, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
