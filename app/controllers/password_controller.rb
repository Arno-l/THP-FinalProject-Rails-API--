require 'faker'

class PasswordController < ApplicationController
  def forgot_password
    User.all.each do |user|
      if user.email.include? params[:email]
        @user = user
      end
    end

    password = Faker::Internet.password
    @user.password = password
    if @user.save
      UserMailer.forgot_password(@user, password).deliver_now
      render json: {
      message: 'Votre nouveau mot de passe à bien été envoyé !',
      success: true,
      }
    else 
      render json: { message: 'Une erreur s\'est produite, veuillez réessayer', success: false }
    end
  end
end
