module YmNotifications::Notification
  
  def self.included(base)
    base.belongs_to(:user)
    base.belongs_to(:resource, :polymorphic => true)
    base.validates(:user, :presence => true)
  end
  
end