class PresencesChannel < ApplicationCable::Channel
  def subscribed
    reject unless current_user.admin?

    stream_from "presences"
  end
end
