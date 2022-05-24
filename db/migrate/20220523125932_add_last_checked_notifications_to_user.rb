class AddLastCheckedNotificationsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :last_checked_notifications, :datetime, default: DateTime.now
  end
end
