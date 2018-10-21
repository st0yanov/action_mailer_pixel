module ActionMailerPixel
  module DSL
    module TrackingPixel
      extend ActiveSupport::Concern

      class Configuration
        def initialize(recipient, campaign)
          @recipient = recipient
          @campaign = campaign
        end

        def recipient
          @recipient.respond_to?(:call) ? @recipient.call : @recipient
        end

        def campaign
          @campaign.respond_to?(:call) ? @campaign.call : @campaign
        end
      end

      class_methods do
        def open_tracking_pixel(recipient: nil, campaign: nil)
          define_method :open_pixel_configuration do
            @open_pixel_configuration ||= Configuration.new(
              recipient.nil? ? send(:open_pixel_recipient) : recipient,
              campaign.nil? ? send(:open_pixel_campaign) : campaign
            )
          end

          define_method :open_pixel_recipient do
            -> do
              begin
                @user ||
                  params[:user] ||
                  ActionMailerPixel.recipient_class.find_by(email: message.to.first)
              rescue NameError
                nil
              end
            end
          end

          define_method :open_pixel_campaign do
            -> do
              begin
                @campaign || params[:campaign]
              rescue NameError
                nil
              end
            end
          end

          define_method :append_open_tracking_pixel do
            interceptor = ActionMailerPixel::Interceptor.new self
            interceptor.setup_pixel
          end

          after_action :append_open_tracking_pixel
        end
      end
    end
  end
end
