require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module RailsApiAppBase
  class Application < Rails::Application
    config.load_defaults 6.0
    config.active_record.default_timezone = :local
    config.time_zone = "Asia/Tokyo"
    config.api_only = true
    config.middleware.use ActionDispatch::Flash
    config.autoload_paths += %W[#{config.root}/lib/autoloads]
    config.generators do |g|
      g.assets false
      g.helper false
      g.skip_routes false
      g.test_framework :rspec,
                       controller_specs: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end
  end
end