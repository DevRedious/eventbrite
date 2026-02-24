class ApplicationMailer < ActionMailer::Base
  default from: ENV.fetch("GMAIL_USERNAME", "no-reply@monsite.fr")
  layout "mailer"
end