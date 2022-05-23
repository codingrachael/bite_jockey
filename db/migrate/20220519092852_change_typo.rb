class ChangeTypo < ActiveRecord::Migration[6.1]
  def change
    change_table :bookings do |t|
      t.rename :equiptment_type, :equipment_type
    end
  end
end
