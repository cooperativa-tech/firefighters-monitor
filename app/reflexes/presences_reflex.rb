class PresencesReflex < ApplicationReflex
  def toggle_status
    user = User.find(element.dataset[:user_id])
    user_updater = UserUpdater.new(user: user)

    user_updater.toggle_status(user.next_status)
  end

  def toggle_duty_type
    user = User.find(element.dataset[:user_id])
    user_updater = UserUpdater.new(user: user)

    user_updater.toggle_duty_type(user.next_duty_type)
  end
end
