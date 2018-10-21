$LOAD_PATH.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'action_mailer_pixel/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'action_mailer_pixel'
  s.version     = ActionMailerPixel::VERSION
  s.authors     = ['Veselin Stoyanov']
  s.email       = ['stoyanov.veseline@gmail.com']
  s.homepage    = 'https://github.com/veskoy/action_mailer_pixel'
  s.summary     = 'Simple ActionMailer open tracking pixel.'
  s.description = <<-DESCRIPTION
  Tracks email open rate by including a tracking pixel in the message body.
  DESCRIPTION

  s.license = 'MIT'

  s.files = Dir[
    '{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md'
  ]

  s.add_dependency 'rails', '~> 5.2'

  s.add_development_dependency 'factory_bot_rails', '~> 4.11'
  s.add_development_dependency 'rspec-rails', '~> 3.8'
  s.add_development_dependency 'sqlite3', '~> 1.3'
end
