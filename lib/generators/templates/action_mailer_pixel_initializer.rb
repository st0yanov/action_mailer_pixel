ActionMailerPixel.configure do |config|
  # Provide a model class name which is going to be used in order to
  # associate the recipient. Default: 'User'
  config.recipient_class = 'User'

  # Provide a model class name which is going to be used in order to
  # associate the specific email delivery. Default: 'Campaign'
  config.campaign_class = 'Campaign'
end
