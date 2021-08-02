class WebhookMailer < ApplicationMailer
  def checkout_session_completed(event)
    @event = event  # access event object in mailer templates
    email = ENV['DEFAULT_EMAIL'] # recipient of email
    mail(to: email, subject: "A checkout session has been completed")
  end
end
