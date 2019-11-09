class UserMailer < ApplicationMailer
	default from: 'no-reply@monsite.fr'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end

  def attend_welcome_email(attendance)

  	 #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @attendance = attendance

    #on définit  variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/event' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @attendance.participant.email, subject: 'Your participation was registered !')  
  end
end