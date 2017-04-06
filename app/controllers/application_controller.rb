class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name
    devise_parameter_sanitizer.for(:account_update) << [:name, :avatar, :password, :password_confirmation]
    # devise_parameter_sanitizer.for(:account_update << :avatar
  end

  def admin_user
    unless current_user.admin?
      flash[:danger] = "You don't have enough permissions"
      redirect_to root_url
    end
  end

  private

  # def set_locale
  #   I18n.locale = params[:locale] if params[:locale].present?
  # end

  # def default_url_options( options={} )
  #   {locale: I18n.locale}
  # end

  def set_locale
    if %w{en ru}.include? params[:locale]
      I18n.locale = params[:locale]
      session[:locale] = params[:locale]
    else
      I18n.locale = session[:locale] || I18n.default_locale
    end
  end

end
