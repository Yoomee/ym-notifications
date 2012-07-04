YmUsers::User.class_eval do

  class << self
    
    def included_with_ym_notifications(base)
      included_without_ym_notifications(base)
      base.send(:include, YmNotifications::UserExt)
    end
    alias_method_chain :included, :ym_notifications
    
  end
  
end
