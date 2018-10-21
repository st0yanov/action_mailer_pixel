require 'rails_helper'

RSpec.describe UntrackedMailer, type: :mailer do
  context 'email content' do
    let(:mail) { UntrackedMailer.sample.deliver_now }

    it 'doesn\'t include a pixel in the html multipart' do
      expect(mail.html_part.body.raw_source).not_to include('img')
    end

    it 'doesn\'t include a pixel in the text multipart' do
      expect(mail.text_part.body.raw_source).not_to include('img')
    end
  end
end
