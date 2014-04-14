module YmNotifications::HasNotifications

  def self.included(base)
    base.has_many :notifications_as_resource, :class_name => "Notification", :as => :resource, :dependent => :destroy
  end

end
