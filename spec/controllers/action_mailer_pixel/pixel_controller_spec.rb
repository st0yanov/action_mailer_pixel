require 'rails_helper'

module ActionMailerPixel
  RSpec.describe PixelController, type: :controller do
    describe 'GET open' do
      let(:email_view) { FactoryBot.create(:email_view) }

      it 'responds with not_found when invalid token is provided' do
        params = { token: 'invalid' }
        get :open, format: :png, params: params
        expect(response).to have_http_status(:not_found)
      end

      context 'request with a valid token' do
        let(:params) { { token: email_view.token } }

        before { get :open, format: :png, params: params }

        it 'http status is 200' do
          expect(response).to have_http_status(:ok)
        end

        it 'contains pixel data in response body' do
          expect(response.body).to eq(Pixel.file_data)
        end

        it 'has appropriate Content-Type header' do
          expect(response.headers['Content-Type']).to eq(Pixel::FILE_TYPE)
        end
      end

      it 'increments shows counter with each hit' do
        params = { token: email_view.token }

        expect { get :open, format: :png, params: params }
          .to change { email_view.reload.views }
          .by 1
      end
    end
  end
end
