module ActionMailerPixel
  class EmailView < ApplicationRecord
    has_secure_token
    belongs_to :recipient, class_name: ActionMailerPixel.recipient_class.to_s
    belongs_to :campaign, class_name: ActionMailerPixel.campaign_class.to_s

    def increment_views!
      increment!(:views)
    end
  end
end
