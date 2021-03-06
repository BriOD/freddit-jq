class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :can_edit?

  private

  def login(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) unless session[:user_id] == nil
  end

  def can_edit?(content)
    current_user && !current_user.banned && (current_user.admin || content.user == current_user)
  end

  def verify_user
    if !current_user
      flash[:error] = "You must log in to start a conversation"
      redirect_to signin_path
    end
  end
end
