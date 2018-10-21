module ControllerHelpers
  extend ActiveSupport::Concern

  included do
    routes { ActionMailerPixel::Engine.routes }
  end
end
