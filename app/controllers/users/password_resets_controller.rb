class Users::PasswordResetsController < UsersController
  skip_before_action :require_login, raise: false
  before_action -> { redirect_back fallback_location: root_path if logged_in? }

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: user_params[:email])

    @user.deliver_reset_password_instructions! if @user.present?

    flash[:success] = "#{User.human_attribute_name(:password)}変更確認メールを送信しました。\nメールに記載されたURLからパスワード変更を完了してください。"
    redirect_to root_url
  end

  def edit
    # NOTE: id = reset_password_token
    @token = params[:id]
    @user  = User.load_from_reset_password_token(params[:id])

    not_authenticated if @user.blank?
  end

  def update
    @token = params[:id]
    @user = User.load_from_reset_password_token(@token)

    return not_authenticated if @user.blank?

    @user.password_confirmation = user_params[:password_confirmation]

    if @user.change_password!(user_params[:password])
      flash[:success] = "#{User.human_attribute_name(:password)}変更が完了しました。"
      redirect_to users_sign_in_url
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
