require 'rails_helper'

RSpec.describe PixelMailer, type: :mailer do
  it 'adds open_pixel_configuration attribute when called' do
    expect(subject.open_pixel_configuration).to be_present
  end

  context 'sets recipient value' do
    context 'no configuration' do
      it 'defaults to nil' do
        expect(subject.open_pixel_configuration.recipient).to be_nil
      end

      it 'respects @user instance variable' do
        subject.instance_variable_set('@user', 1)
        expect(subject.open_pixel_configuration.recipient).to be(1)
      end
    end
  end

  context 'sets campaign value' do
    context 'no configuration' do
      it 'default to nil' do
        expect(subject.open_pixel_configuration.campaign).to be_nil
      end

      it 'respects @campaign instance variable' do
        subject.instance_variable_set('@campaign', 1)
        expect(subject.open_pixel_configuration.campaign).to be(1)
      end
    end
  end

  context 'email content' do
    let(:user) { FactoryBot.create(:user) }
    let(:campaign) { FactoryBot.create(:campaign) }
    before do
      @mail = PixelMailer.with(user: user, campaign: campaign)
                         .sample
                         .deliver_now
      @email_view = ActionMailerPixel::EmailView.find_by(
        recipient: user,
        campaign: campaign
      )
    end

    it 'includes a pixel in the html multipart' do
      expect(@mail.html_part.body.raw_source).to include(@email_view.token)
    end

    it 'doesn\'t include a pixel in the text multipart' do
      expect(@mail.text_part.body.raw_source).not_to include(@email_view.token)
    end
  end
end
