class Users::ResendActivationTokenController < ApplicationController
  skip_before_action :require_login, raise: false

  def show
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])
    return render :show unless @user.valid_password?(user_params[:password])

    if @user.activation_token.blank?
      flash[:error] = t('view.users.resend_activation_token.failure.already_activated')
      return redirect_to users_sign_in_url
    end

    UserMailer.activation_needed_email(@user).deliver_now
    flash[:success] = t('view.users.resend_activation_token.success')
    redirect_to users_sign_in_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
