require 'ym_core'
require 'ym_users'
require "ym_notifications/engine"

module YmNotifications
end

Dir[File.dirname(__FILE__) + '/ym_notifications/models/*.rb'].each {|file| require file }
