class PixelMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  open_tracking_pixel

  def sample
    mail(to: 'recipient@example.com')
  end
end
