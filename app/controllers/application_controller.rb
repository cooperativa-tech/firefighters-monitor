class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  include Pundit

  before_action :require_login, :set_raven_context
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def not_authorized
    raise ActionController::RoutingError, "Not Found" unless current_user&.admin?
  end

  def set_raven_context
    Raven.user_context(username: current_user.username)
    Raven.extra_context(params: params.to_unsafe_h, url: request.url)
  end
end
