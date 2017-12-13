class Users::ActivateController < ApplicationController
  skip_before_action :require_login, raise: false

  def index
    # NOTE: user_id = activation_token
    if (@user = User.load_from_activation_token(params[:user_id]))
      @user.activate!
      redirect_to(users_sign_in_path, notice: 'User was successfully activated.')
    else
      not_authenticated
    end
  end
end
