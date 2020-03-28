class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.text :description
      t.integer :duration
      t.date :release_date
      t.string :image_url

      t.timestamps
    end
  end
end
