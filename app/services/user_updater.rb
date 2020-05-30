class UserUpdater
  include CableReady::Broadcaster

  def initialize(user:, triggered_by: nil)
    @user = user
    @triggered_by = triggered_by
  end

  def toggle_status(status)
    user.update(status: status)

    broadcast_to_others
  end

  def toggle_duty_type(duty_type)
    user.update(duty_type: duty_type)

    broadcast_to_others
  end

  private

  attr_reader :triggered_by, :user

  def broadcast_to_others
    event = {
      name: "presences:update",
      detail: { triggered_by: triggered_by&.id }
    }
    cable_ready["presences"].dispatch_event(event)

    cable_ready.broadcast
  end
end
