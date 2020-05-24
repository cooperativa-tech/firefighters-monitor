class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
    @available_users = @users.available
    @service_users = @users.service
  end
end
