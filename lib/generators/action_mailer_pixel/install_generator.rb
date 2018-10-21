module ActionMailerPixel
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path('../../templates', __FILE__)
      desc 'Creates ActionMailerPixel initializer for your application'

      def copy_initializer
        template 'action_mailer_pixel_initializer.rb',
                 'config/initializers/action_mailer_pixel.rb'

        puts 'ActionMailerPixel initializer created successfully.'
      end
    end
  end
end
