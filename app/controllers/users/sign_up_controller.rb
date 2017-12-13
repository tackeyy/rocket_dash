class Users::SignUpController < UsersController
  skip_before_action :require_login, raise: false
  before_action -> { redirect_back fallback_location: root_path if logged_in? }

  def show
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    return render :show if @user.errors.present?

    redirect_to root_url, notice: "登録確認#{User.human_attribute_name(:email)}を送信しました。"
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
