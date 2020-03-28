class CreateSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :slots do |t|
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
