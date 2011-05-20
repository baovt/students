# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Students::Application.initialize!

Students::Application.configure do
config.action_mailer.default_url_options = { :host => 'localhost:3000' }
config.action_mailer.delivery_method = :smtp
config.action_mailer.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587,
:domain => "domain.of.sender.net",
:authentication => "plain",
:user_name => "ong.vuong99",
:password => "a!12345678",
:enable_starttls_auto => true
}
end


