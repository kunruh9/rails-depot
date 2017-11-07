# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

Depot::Application.configure do
  config.action_mailer.delivery_method = :smtp

  config.action_mailer.smtp_settings = {
    address:              "smtp.gmail.com",
    port:                 587,
    domain:               "gmail.com",
    authentication:       "plain",
    user_name:            "kunruh9@gmail.com",
    password:             "d0YUERkUQ7l7mM7^rDe&1",
    enable_starttls_auto: true
  }
end
