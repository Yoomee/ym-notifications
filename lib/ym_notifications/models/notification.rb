module YmNotifications::Notification
  
  def self.included(base)
    base.belongs_to(:user)
    base.belongs_to(:resource, :polymorphic => true)
    base.validates(:user, :presence => true)
    base.scope :unread, base.where(:read => false)
    base.per_page = 20
  end
  
  def resource_text
    return '' if resource.nil?
    if resource.respond_to?(:text)
      resource.text
    elsif resource.respond_to?(:description)
      resource.description
    else
      resource.to_s
    end
  end
  
end