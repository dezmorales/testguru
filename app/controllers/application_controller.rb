# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user,
                :logged_in?

  private

  def redirect
    session[:forwarding_url] = request.original_url if request.get?
  end

  def logout
    reset_session
    @current_user = nil
  end

  def authenticate_user!
    redirect
    unless current_user
      redirect_to login_path, alert: 'Проверьте ваш email и пароль пожалуйста.'
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
