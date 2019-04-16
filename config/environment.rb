# Load the Rails application.
require_relative 'application'

ActionMailer::Base.smtp_settings= {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :domain => 'heroku.com',
  :authentication => :plain,
  :user_name => 'apikey',
  :password => ['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',
  :enable_starttls_auto => true
}

# Initialize the Rails application.
Rails.application.initialize!
