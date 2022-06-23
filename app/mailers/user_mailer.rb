class UserMailer < ApplicationMailer
    default from: 'testTHP@gmx.fr'
    def forgot_password(user, password)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 
    @password = password
    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Votre nouveau mot de passe !', from: 'no-reply@pokeland.fr' ) 
    end
end