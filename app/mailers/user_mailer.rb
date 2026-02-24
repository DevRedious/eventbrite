class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url  = "http://monsite.fr/login"
    mail(to: @user.email, subject: "Bienvenue chez nous !")
  end
  def new_attendance_email(attendance)
    @attendance = attendance
    @event = attendance.event
    @attendee = attendance.user
    @organizer = @event.user
    mail(to: @organizer.email, subject: "Nouvelle inscription à #{@event.title}")
  end
end
