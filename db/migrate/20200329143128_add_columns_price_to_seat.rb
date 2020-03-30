class AddColumnsPriceToSeat < ActiveRecord::Migration[6.0]
  def change
    add_column :seats, :price, :integer
  end
end
