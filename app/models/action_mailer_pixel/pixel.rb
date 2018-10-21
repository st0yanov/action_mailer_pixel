module ActionMailerPixel
  class Pixel
    BASE64_PNG_PIXEL = 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAQAAAC1HAwCAAAAC0lEQVR42mNkYAAAAAYAAjCB0C8AAAAASUVORK5CYII=
'.freeze
    FILE_TYPE = 'image/png'.freeze

    def self.file_data
      Base64.decode64(BASE64_PNG_PIXEL)
    end
  end
end
