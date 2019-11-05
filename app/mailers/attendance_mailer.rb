class AttendanceMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(attendence)
    @attendance = attendance
    @attendance_participant = User.find(@attendance.participant_id)
    @attendance_event = @attendance.event
    @admin = User.find(@attendance.event.admin_id)
    @url = 'http://monsite.fr/login' 
    mail(to: @admin.email, subject: "Un utilisateur à rejoint l'évenement !")
  end
end
