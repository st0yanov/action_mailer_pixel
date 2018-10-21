require 'action_mailer_pixel/engine'

module ActionMailerPixel
  class << self
    attr_accessor :configuration

    def configure
      @configuration ||= Configuration.new
      yield @configuration
    end

    def recipient_class
      @configuration.recipient_class.constantize
    end

    def campaign_class
      @configuration.campaign_class.constantize
    end
  end

  class Configuration
    attr_accessor :recipient_class, :campaign_class

    def initialize
      @recipient_class = 'User'
      @campaign_class = 'Campaign'
    end
  end
end
