module YmNotifications
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration

      source_root File.expand_path("../templates", __FILE__)
      desc "Installs YmNotifications."

      def manifest
        copy_file "models/notification.rb", "app/models/notification.rb"
        
        # Migrations must go last
        try_migration_template "migrations/create_notifications.rb", "db/migrate/create_notifications"
      end

      def self.next_migration_number(path)
        unless @prev_migration_nr
          @prev_migration_nr = Time.now.utc.strftime("%Y%m%d%H%M%S").to_i
        else
          @prev_migration_nr += 1
        end
        @prev_migration_nr.to_s
      end

      private
      def try_migration_template(source, destination)
        begin
          migration_template source, destination
        rescue Rails::Generators::Error => e
          puts e
        end
      end
      
    end
  end
end
