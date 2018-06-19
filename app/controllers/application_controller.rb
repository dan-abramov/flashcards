class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  protect_from_forgery with: :exception
  before_action :set_locale

  private

  def set_locale
    locale = if current_user
               current_user.locale
             elsif params[:user_locale]
               params[:user_locale]
             elsif session[:locale]
               session[:locale]
             else
               http_accept_language.compatible_language_from(I18n.available_locales)
             end

    if locale && I18n.available_locales.include?(locale.to_sym)
      session[:locale] = I18n.locale = locale
    else
      session[:locale] = I18n.locale = I18n.default_locale
    end

  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end
  
  # For ActiveAdmin

  # def access_denied
  #   flash[:notice] = 'Для начала авторизуйтесь. Спасибо.'
  #   redirect_to new_user_session_path
  # end
  #
  # def current_admin_user
  #   current_user
  # end
  #
  # def destroy_admin_user_session_path
  #   logout
  #   redirect_to login_path, notice: t(:log_out_is_successful_notice)
  # end
end
