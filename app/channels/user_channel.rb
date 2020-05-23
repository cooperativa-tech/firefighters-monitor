class UserChannel < ApplicationCable::Channel
  def subscribed
    @user = User.find_by(id: params[:user_id])

    @user ? stream_for(@user) : reject
  end

  def toggle
    new_status = @user.toggle_status

    UserChannel.broadcast_to(@user, status: new_status)
  end
end
