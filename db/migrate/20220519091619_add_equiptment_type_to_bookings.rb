class AddEquiptmentTypeToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :equiptment_type, :string
  end
end
