module YmNotifications
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include YmCore::Generators::Migration
      include YmCore::Generators::Ability

      source_root File.expand_path("../templates", __FILE__)
      desc "Installs YmNotifications."

      def manifest
        copy_file "models/notification.rb", "app/models/notification.rb"
        copy_file "controllers/notifications_controller.rb", "app/controllers/notifications_controller.rb"
        
        if should_add_abilities?('Notification')
          add_ability(:user, 'can :index, Notification')
        end
        
        # Migrations must go last
        try_migration_template "migrations/create_notifications.rb", "db/migrate/create_notifications.rb"
      end
      
    end
  end
end
