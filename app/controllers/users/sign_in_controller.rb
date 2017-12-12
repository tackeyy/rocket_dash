class Users::SignInController < ApplicationController
  skip_before_action :require_login, raise: false
  before_action -> { redirect_back fallback_location: root_path if logged_in? }

  def show
    @user = User.new
  end

  def create
    email, password = params[:user].values_at(:email, :password)

    @user = login(email, password)

    if @user.blank?
      @user = User.new(email: email).tap { |user| user.errors.add(:email, :not_found_or_invalid_password) }
      return render :show
    end

    redirect_back_or_to root_url
  end
end
