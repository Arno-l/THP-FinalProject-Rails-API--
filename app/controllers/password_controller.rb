class PasswordController < ApplicationController
  def forgot_password
    @user = User.find_by(email: params[:email])
    password = Faker::Internet.password
    @user.password = password
    if @user.save
      UserMailer.forgot_password(@user, password).deliver_now
      change_success
    else 
      change_failed
    end
  end

  private 

  def change_success
    render json: {
      message: 'Votre nouveau mot de passe à bien été envoyé !',
      success: true,
    }
  end

  def change_failed
    render json: { message: 'Une erreur s\'est produite, veuillez réessayer', success: false }
  end
end
