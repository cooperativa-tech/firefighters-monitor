class ApplicationController < ActionController::Base
  include HttpAcceptLanguage::AutoLocale
  include Pundit

  before_action :require_login
  rescue_from Pundit::NotAuthorizedError, with: :not_authorized

  private

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end

  def not_authorized
    raise ActionController::RoutingError, "Not Found" unless current_user&.admin?
  end
end
