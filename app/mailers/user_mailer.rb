class UserMailer < ApplicationMailer
  include Rails.application.routes.url_helpers

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
    @user = user
    @url  = users_activate_path(id: user.activation_token)
    mail(to: user.email, subject: "#{User.model_name.human}登録を完了しましょう！")
  end

  def activation_success_email(user)
    @user = user
    @url  = users_sign_in_path
    mail(to: user.email, subject: "#{User.model_name.human}登録が完了しました。")
  end

  def reset_password_email(user)
    @user = User.find user.id
    @url  = edit_users_password_reset_url(@user.reset_password_token)
    mail(to: user.email, subject: "Your password has been reset")
  end
end
