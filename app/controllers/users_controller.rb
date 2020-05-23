class UsersController < ApplicationController
  def index
    @users = User.all
    @available_users = @users.select { |user| user.available? }
    @service_users = @users.select { |user| user.service? }
  end
end
