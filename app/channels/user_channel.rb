class UserChannel < ApplicationCable::Channel
  def subscribed
    stream_for user
  end

  def toggle
    user.status = user.unavailable? ? "available" : "unavailable"
    user.save

    UserChannel.broadcast_to(user, user: user)
  end

  private

  def user
    @_user ||= User.find(params[:user_id])
  end
end
