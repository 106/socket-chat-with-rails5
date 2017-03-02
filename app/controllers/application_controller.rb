class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authenticate_user!
    if cookies[:user_id].present?
      @current_user ||= User.find_by(name: cookies[:user_id])
    else
      redirect_to sign_in_path, flash: { notice: 'You need to be authorized' }
    end
  end
end
