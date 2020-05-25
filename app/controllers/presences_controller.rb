class PresencesController < ApplicationController
  def index
    authorize :presences

    @users = User.all.order(:id)
    @available_users = @users.available.order(:id)
    @service_users = @users.service.order(:id)
    @picket_users = @users.picket.order(:id)
    @elac_users = @users.elac.order(:id)
    @eip_users = @users.eip.order(:id)
  end
end
