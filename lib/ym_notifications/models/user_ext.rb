module YmNotifications::UserExt
  
  def self.included(base)
    base.has_many :notifications, :order => "created_at DESC"
    base.send(:attr_writer, :unread_notification_count)
  end
  
  def unread_notification_count
    @unread_notification_count ||= notifications.unread.count
  end
  
end
