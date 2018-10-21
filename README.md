# ActionMailerPixel
ActionMailerPixel allows you to easily track your mailers' open rate.

## How it works
When you enable the open tracking pixel on a mailer, a simple **img** tag will be inserted right before the closing body tag upon delivery. The source of the image tag leads to the /open.png path wherever you mounted the engine in your application. The response is a 1x1px transparent PNG image. When the email is opened by an email client, the pixel might get rendered (depending on the security/privacy settings) and the opening will be saved. Open rate is tracked by user and by email campaign. This way you can see exactly who opened a specific email.

## Usage
**1. Default (convention over configuration)** - pixel is created with the first available of the following:
- *@user* -> *params[:user]* -> *recipient_class.find_by(email: message.to.first)*
- *@campaign* -> *params[:campaign]*
```ruby
class PixelMailer < ApplicationMailer
  open_tracking_pixel

  def sample
    mail(to: 'recipient@example.com')
  end
end
```

**2. Explicit use** - pixel is created with the provided data
```ruby
class PixelMailer < ApplicationMailer
  open_tracking_pixel recipient: -> { params[:user] },
                      campaign:  -> { params[:campaign] }

  def sample
    mail(to: 'recipient@example.com')
  end
end
```

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'action_mailer_pixel'
```

And then execute:
```bash
$ bundle
$ bundle exec rails action_mailer_pixel:install:migrations
$ bundle exec rails db:migrate
$ bundle exec rails action_mailer_pixel:install
```

Mount the engine on a path of choice in **config/routes.rb**:
```ruby
mount ActionMailerPixel::Engine => '/action_mailer_pixel'
```

## Contributing
Contributions are welcome.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
