require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Feefavor
  class Application < Rails::Application
    config.generators do | g |
      g.assets          false
      g.helper          false
      g.jbuilder        false
      g.stylesheets     false
      g.test_framework :rspec
    end
  end
end
