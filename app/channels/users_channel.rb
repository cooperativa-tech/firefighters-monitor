class UsersChannel < ApplicationCable::Channel
  def subscribed
    stream_from "users"
  end
end
