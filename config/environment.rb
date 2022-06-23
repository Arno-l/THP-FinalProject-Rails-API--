# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['MAILJET_PUBLIC_KEY'],
    :password => ENV['MAILJET_SECRET_KEY'],
    :address => 'in-v3.mailjet.com',
    :port => 587,
  }