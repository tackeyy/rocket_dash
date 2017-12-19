class Users::ActivateController < ApplicationController
  skip_before_action :require_login, raise: false

  def show
    # NOTE: id = activation_token
    if (@user = User.load_from_activation_token(params[:id]))
      @user.activate!
      redirect_to(users_sign_in_path, notice: 'User was successfully activated.')
    else
      not_authenticated
    end
  end
end
