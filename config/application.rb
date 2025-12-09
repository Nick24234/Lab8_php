require_relative "boot"

require "rails/all"


Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
   
    config.load_defaults 7.0

    # Локалізація
    config.i18n.default_locale = :uk
    config.i18n.available_locales = [:uk, :en]
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
  
  end
end

