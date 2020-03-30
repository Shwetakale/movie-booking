class ChangeColumnPriceInReservation < ActiveRecord::Migration[6.0]
  def change

    # This was needed as price got add as foreign key :(
    remove_column :reservations, :price, :integer
    add_column :reservations, :price, :integer
  end
end
