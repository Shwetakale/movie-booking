class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :screen, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :price, null: false, foreign_key: true
      t.boolean :paid
      t.boolean :active

      t.timestamps
    end
  end
end
