class PresencesReflex < ApplicationReflex
  include CableReady::Broadcaster

  def toggle_status
    user = User.find(element.dataset[:user_id])
    user.toggle_status
    broadcast_to_others
  end

  def toggle_duty_type
    user = User.find(element.dataset[:user_id])
    user.toggle_duty_type
    broadcast_to_others
  end

  private

  def broadcast_to_others
    event = {
      name: "presences:update",
      detail: { triggered_by: current_user.id }
    }
    cable_ready["presences"].dispatch_event(event)

    cable_ready.broadcast
  end
end
