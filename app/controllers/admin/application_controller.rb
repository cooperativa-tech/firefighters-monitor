module Admin
  class ApplicationController < Administrate::ApplicationController
    before_action :authenticate_admin

    def authenticate_admin
      raise ActionController::RoutingError, "Not Found" unless current_user&.admin?
    end
  end
end
