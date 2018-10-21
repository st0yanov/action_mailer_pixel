module ActionMailerPixel
  class Interceptor
    def initialize(mailer)
      @mailer = mailer
    end

    def setup_pixel
      if html?
        @email_view = EmailView.create(recipient: recipient, campaign: campaign)

        raw_source = (message.html_part || message).body.raw_source
        regex = /<\/body>/i

        if raw_source.match(regex)
          raw_source.gsub!(regex, "#{pixel_html}\\0")
        else
          raw_source << pixel_html
        end
      end
    end

    private

    def message
      @mailer.message
    end

    def configuration
      @mailer.open_pixel_configuration
    end

    def recipient
      configuration.recipient
    end

    def campaign
      configuration.campaign
    end

    def pixel_url
      options = (ActionMailer::Base.default_url_options || {})
                  .merge({
                    controller: 'action_mailer_pixel/pixel',
                    action: 'open',
                    token: @email_view.token,
                    format: 'png'
                  })
      ActionMailerPixel::Engine.routes.url_helpers.url_for(options)
    end

    def pixel_html
      ActionController::Base.helpers.image_tag(pixel_url, size: '1x1', alt: '')
    end

    def html?
      (message.html_part || message).content_type.include? 'text/html'
    end
  end
end
