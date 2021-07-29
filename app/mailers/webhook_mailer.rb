class WebhookMailer < ApplicationMailer
  def checkout_session_completed(event)
    @event = event
    email = ENV['DEFAULT_EMAIL']
    mail(to: email, subject: "A checkout session has been completed")
  end
end
