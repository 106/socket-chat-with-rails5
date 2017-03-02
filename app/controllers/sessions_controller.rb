class SessionsController < ApplicationController
  def create
    user = User.create(user_params)
    cookies[:user_id] = user.name
    redirect_to chat_path
  end

  def new
    @user = User.new
  end

  def destroy
    cookies[:user_id] = nil
    redirect_to sign_in_path
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
