ActionMailer::Base.smtp_settings = {
  user_name: "apikey",
  password: Rails.application.credentials.sendgrid[:api_key],
  domain: "sheltered-scrubland-13514-4781bfba8fe6.herokuapp.com",
  address: "smtp.sendgrid.net",
  port: 587,
  authentication: :plain,
  enable_starttls_auto: true
}
