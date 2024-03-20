class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :check_in
      t.datetime :check_out
      t.integer :no_of_rooms

      t.timestamps
    end
  end
end
