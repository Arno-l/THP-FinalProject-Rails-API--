class PasswordController < ApplicationController
  def forgot_password
    @user = User.find(params[:id])
    password = Faker::Internet.password
    @user.password = password
    if @user.save
      UserMailer.forgot_password(@user, password).deliver_now
    end
  end

end
