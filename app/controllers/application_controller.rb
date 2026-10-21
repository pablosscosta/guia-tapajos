class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  private

  def require_login
    raise "O FILTRO FOI CHAMADO!"
    unless logged_in?
      redirect_to login_path, alert: "Você precisa fazer login para continuar."
    end
  end
end