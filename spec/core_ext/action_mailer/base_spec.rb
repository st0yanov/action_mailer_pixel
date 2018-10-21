require 'rails_helper'

module ActionMailer
  RSpec.describe Base do
    describe '#open_tracking_pixel' do
      it 'is available' do
        expect(subject.class).to respond_to(:open_tracking_pixel)
      end
    end
  end
end
