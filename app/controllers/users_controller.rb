class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
    @available_users = @users.select(&:available?)
    @service_users = @users.select(&:service?)
  end
end
