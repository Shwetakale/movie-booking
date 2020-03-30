class RemoveAssociationScreenFromReservation < ActiveRecord::Migration[6.0]
  def change
    remove_reference :reservations, :screen, null: false, foreign_key: true
  end
end
