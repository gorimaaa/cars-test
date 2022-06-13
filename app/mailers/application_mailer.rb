class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  layout "mailer"

  def send_reminder(booking)
    details = {to: 'fakeuser@roadstr.fr',
               object: 'Reminder for your booking'}
    mail(details)
  end
end
