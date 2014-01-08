require 'devise/orm/active_record'
Devise.setup do |config|
  config.router_name = :Shadmin_admin

  config.secret_key = '67ec5b0fd50e60cc11b347698da513e38db1b3d44dcb17e77dc0fe3518fbc422a2a69201c865485eb5acbf9f4fd816dbc43dff8cfcffcc84b23e2185a13aeae8'
end