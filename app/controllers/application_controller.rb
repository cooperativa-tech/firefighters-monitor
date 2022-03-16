class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :require_login, :set_raven_context, :set_locale
  after_action :refresh_session
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(request.referer || root_path)
  end

  def set_raven_context
    Raven.user_context(username: current_user.username) if current_user
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end

  def set_locale
    I18n.locale = http_accept_language.compatible_language_from(I18n.available_locales)
    session[:locale] = I18n.locale
  end

  def refresh_session
    ActiveRecord::SessionStore::Session.find_by(session_id: session.id&.private_id)&.touch # rubocop:disable all
  end
end
