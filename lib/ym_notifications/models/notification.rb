module YmNotifications::Notification
  
  def self.included(base)
    base.belongs_to(:user)
    base.belongs_to(:resource, :polymorphic => true)
    base.validates(:user, :presence => true)
    base.scope :unread, base.where(:read => false)
    base.per_page = 20
  end

  def image_path
    polymorphic_path(resource_for_image)
  end

  def resource_for_image
    if resource.respond_to?(:user)
      resource.user
    else
      resource
    end
  end

  def resource_path
    polymorphic_path(resource_for_path)
  end
  
  def resource_text
    return '' if resource.nil?
    if resource.respond_to?(:text)
      resource.text
    elsif resource.respond_to?(:description)
      resource.description
    end
  end
  
  private
  def resource_for_path
    resource
  end

end