class UserChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:user_id])

    @user ? stream_for(@user) : reject
  end

  def toggle
    @user.status = @user.unavailable? ? "available" : "unavailable"
    @user.save

    UserChannel.broadcast_to(@user, user: @user)
  end
end
