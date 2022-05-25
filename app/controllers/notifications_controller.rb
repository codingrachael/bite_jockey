class NotificationsController < ApplicationController
  def index
    # def unchecked_notifications
    #   notifications.where("created_at > ?", last_checked_notifications)
    # end
    @notifications = current_user.unchecked_notifications
    render
    Thread.new do
      current_user.update(last_checked_notifications: DateTime.now)
    end
  end
end
