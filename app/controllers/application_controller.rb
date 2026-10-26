class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  before_action :require_login
  skip_before_action :require_login, only: [:home]


  def home
    if logged_in?
      redirect_to pois_path
    else
      redirect_to login_path
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  private

  def require_login
    unless logged_in?
      redirect_to login_path, alert: "Você precisa fazer login para continuar."
    end
  end

  def require_admin
    unless current_user&.admin?
      redirect_to root_path, alert: "Acesso negado. Apenas administradores."
    end
  end
end