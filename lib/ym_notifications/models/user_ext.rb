module YmNotifications::UserExt
  
  def self.included(base)
    base.has_many :notifications, :order => "created_at DESC"
  end
  
end
