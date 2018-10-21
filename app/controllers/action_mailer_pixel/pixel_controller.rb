module ActionMailerPixel
  class PixelController < ApplicationController
    attr_reader :email_view

    rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def open
      respond_to do |format|
        format.png do
          email_view.increment_views!
          send_data Pixel.file_data,
                    type: Pixel::FILE_TYPE,
                    disposition: 'inline'
        end
      end
    end

    private

    def email_view
      @email_view = EmailView.find_by!(token: params[:token])
    end

    def handle_record_not_found
      head :not_found
    end
  end
end
