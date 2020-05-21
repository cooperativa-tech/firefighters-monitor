class SessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    logged_in = login(user_params[:email], user_params[:password])

    if logged_in
      redirect_back_or_to(:users, notice: "Login successful")
    else
      flash.now[:alert] = "Login failed"

      render action: "new"
    end
  end

  def destroy
    logout

    redirect_to(:users, notice: "Logged out!")
  end

  private

  def user_params
    @_user_params ||= params.require(:user).permit(:email, :password)
  end
end
