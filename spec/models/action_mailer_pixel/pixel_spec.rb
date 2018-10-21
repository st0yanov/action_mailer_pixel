require 'rails_helper'

module ActionMailerPixel
  RSpec.describe Pixel do
    it 'provides BASE64_PNG_PIXEL constant' do
      expect(Pixel::BASE64_PNG_PIXEL).not_to be_empty
    end

    it 'provides FILE_TYPE constant' do
      expect(Pixel::FILE_TYPE).to eq('image/png')
    end

    it 'has static #file_data method' do
      expect(Pixel).to respond_to(:file_data)
    end
  end
end
