module YmNotifications::NotificationsHelper

  def link_to_notification_image(notification)
    resource = notification.resource
    if resource.is_a?(User)
      # skip
    elsif resource.respond_to?(:user)
      resource = resource.user
    elsif resource.respond_to?(:image)
      resource = resource.image
    end
    resource ? link_to(image_for(resource, '60x60#'), resource, :class => 'notification-img') : ''
  end

  def link_to_notification_resource(notification, user = current_user)
    link_to("view #{notification.resource_type.humanize.downcase}", polymorphic_url(notification.resource), :icon => 'arrow-right')
  end

  def notification_description(notification, user = current_user)
    case notification.resource_type
    when 'Comment'
      link_to(notification.resource.user, user_url(notification.resource.user)) +
      ' commented on ' +
      link_to("#{nickname_or_your(notification.resource.post.user, :their_user => notification.resource.user)} post", polymorphic_url(notification.resource))
    when 'Post'
      link_to_self(notification.resource.user) +
      ' posted on ' +
      link_to('your profile', user_url(user))
    end
  end

end