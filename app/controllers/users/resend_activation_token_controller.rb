class Users::ResendActivationTokenController < ApplicationController
  skip_before_action :require_login, raise: false

  def show
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    return render :show unless @user.valid_password?(user_params[:password])

    UserMailer.activation_needed_email(@user).deliver_now
    redirect_to root_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
