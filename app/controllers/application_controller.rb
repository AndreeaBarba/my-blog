class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end
  helper_method :current_user

  def logged_in?
    session[:user_id] != nil
  end
  helper_method :logged_in?

  def authenticate!
    redirect_to new_session_path unless logged_in?
  end
  helper_method :authenticate!

  def authorize!(user)
    redirect_to '/not_authorized' unless authorized?(user)
  end
  helper_method :authorize!

  def authorized?(user)
    current_user == user
  end
  helper_method :authorized?

end
