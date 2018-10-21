require 'rails_helper'

module ActionMailerPixel
  RSpec.describe EmailView, type: :model do
    describe '#increment_views!' do
      let(:email_view) { FactoryBot.create(:email_view, :no_views) }

      it 'increases the views count by 1' do
        expect { email_view.increment_views! }
          .to change { email_view.views }.by(1)
      end
    end
  end
end
