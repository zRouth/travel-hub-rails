require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module TravelHub
  class Application < Rails::Application
    config.generators.stylesheets = false
    config.generators.javascripts = false
    config.generators.helper      = false
    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
  end
end
