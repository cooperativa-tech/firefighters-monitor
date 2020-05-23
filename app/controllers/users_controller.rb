class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
    @available_users = @users.select { |user| user.available? }
    @service_users = @users.select { |user| user.service? }
  end
end
