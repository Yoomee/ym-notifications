module NotificationsHelper

  def link_to_notification_user_message(notification)
    case notification.resource_type
    when 'Comment'
      link_to_self(notification.resource.user, :class => 'notification-link-user') +
      ' commented on ' +
      link_to("#{nickname_or_your(notification.resource.post.user, :their_user => notification.resource.user)} post", notification.resource, :class => 'notification-link-item')
    when 'Post'
      link_to_self(notification.resource.user, :class => 'notification-link-user') +
      ' posted on ' +
      link_to('your profile', current_user, :class => 'notification-link-item')
    end
  end

end