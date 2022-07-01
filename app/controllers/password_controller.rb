require 'faker'

class PasswordController < ApplicationController
  def forgot_password
    @user = User.find(params.permit(:email))

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

  private

  def post_params
    params.require(:user).permit(:email)
  end
end
