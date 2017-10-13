require File.expand_path('../boot', __FILE__)

require 'rails/all'
require 'csv'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SIGED
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)
    config.active_job.queue_adapter = :delayed_job
    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.active_record.default_timezone = :local
    config.time_zone = 'Mexico City'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
    
    config.action_mailer.default_url_options = { :host => '192.168.15.55:3000' }
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.perform_deliveries = true
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.default :charset => "utf-8"

    ActionMailer::Base.smtp_settings = {
        :address              => 'smtp.gmail.com',
        :domain               => 'mail.google.com',
        :port                 =>  587,
        :user_name            => '11161033@itoaxaca.edu.mx',
        :password             => 'Mayteookami',
        :authentication       =>'login',
        :enable_starttls_auto => true
    }

    #config.action_mailer.delivery_method = :smtp
    #config.action_mailer.smtp_settings = {
    #    :port => 587,
    #    :address => "smtp.mailgun.org", 
    #    :domain => ENV['domain'], 
    #    :user_name => ENV['username'],
    #    :password => ENV['password'],
    #    :authentication => :plain        
    #} 
     end
end
