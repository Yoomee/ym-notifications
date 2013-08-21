module YmNotifications::NotificationsController

  def self.included(base)
    base.load_and_authorize_resource
    base.after_filter :set_all_read
  end
  
  def index
    @notifications = current_user.notifications.order("created_at DESC").page(params[:page])
    current_user.unread_notification_count = current_user.unread_notification_count - @notifications.size
  end
  
  def set_all_read
    @notifications.unread.each {|n| n.update_attribute(:read, true)}
  end

end