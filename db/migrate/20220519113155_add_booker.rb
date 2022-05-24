class AddBooker < ActiveRecord::Migration[6.1]
  def change
    add_reference :bookings, :booker, references: :users, index: true
  end
end
