class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.datetime :datetime
      t.integer :amount_of_people
      t.references :restaurant, index: true, null: false
      t.references :customer, index: true, null: false

      t.timestamps null: false
    end
  end
end
