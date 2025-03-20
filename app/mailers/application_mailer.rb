class ApplicationMailer < ActionMailer::Base
  default from: "bot@roadstr.fr"
  layout "mailer"

  def send_confirmation(reservation, user)
    @user = user
    @reservation = reservation
    details = {from: "admin@roadstr.fr",
               to: user.email,
               object: 'Confirmation for your booking'}
    mail(details)
  end

  def send_reminder_admin(reservation, user)
    @user = user
    @reservation = reservation
    details = {from: "admin@roadstr.fr",
               to: user.email,
               object: 'Reminder for your booking from admin'}
    mail(details)
  end
  
  def send_reminder(reservation, user)
    @user = user
    @reservation = reservation
    details = {to: user.email,
               object: 'Reminder for your booking'}
    mail(details)
  end
end
