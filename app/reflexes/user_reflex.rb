class UserReflex < StimulusReflex::Reflex
  def toggle_status
    user = User.find(element.dataset[:user_id])

    user.toggle_status
  end
end
