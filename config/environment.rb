# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    address:        'smtp.gmail.com', # default: localhost
    port:           '587',
    user_name:      'onlinegrocerycomparison',
    password:       'Project@2019',
    authentication: :plain,
    enable_starttls_auto: true
}

