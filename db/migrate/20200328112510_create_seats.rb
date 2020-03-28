class CreateSeats < ActiveRecord::Migration[6.0]
  def change
    create_table :seats do |t|
      t.string :row, limit: 5
      t.integer :number

      t.timestamps
    end
  end
end
