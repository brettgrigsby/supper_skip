require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.

$VERBOSE = nil
Kernel.silence_warnings do
  Bundler.require(*Rails.groups)
end

module DinnerDash
  class Application < Rails::Application
    config.action_mailer.delivery_method = :smtp

    config.action_mailer.smtp_settings = {
      address:              'smtp.mandrillapp.com',
      port:                 '587',
      domain:               'supperskip.com',
      user_name:            "gbrett@gmail.com",
      password:             "38s6lGi6JNuY5mYq3DxKlw",
      authentication:       'plain',
      enable_starttls_auto: true
    }

  end
end
