class UntrackedMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def sample
    mail(to: 'recipient@example.com')
  end
end
