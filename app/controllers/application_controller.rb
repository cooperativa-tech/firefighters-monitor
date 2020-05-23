class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  before_action :require_login

  def not_authenticated
    redirect_to login_path, alert: "Please login first"
  end
end
