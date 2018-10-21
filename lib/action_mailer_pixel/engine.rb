require 'action_mailer_pixel/dsl/tracking_pixel'
require 'action_mailer_pixel/interceptor'

module ActionMailerPixel
  class Engine < ::Rails::Engine
    isolate_namespace ActionMailerPixel

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_bot
      g.factory_bot dir: 'spec/factories'
    end

    config.to_prepare do
      ::ActionMailer::Base.include ActionMailerPixel::DSL::TrackingPixel
    end
  end
end
