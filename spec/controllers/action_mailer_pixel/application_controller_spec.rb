require 'rails_helper'

module ActionMailerPixel
  RSpec.describe ApplicationController, type: :controller do
    context 'initializer configuration' do
      it 'sets recipient_class value' do
        expect(ActionMailerPixel.recipient_class.to_s).to eq('User')
      end

      it 'sets campaign_class value' do
        expect(ActionMailerPixel.campaign_class.to_s).to eq('Campaign')
      end
    end
  end
end
