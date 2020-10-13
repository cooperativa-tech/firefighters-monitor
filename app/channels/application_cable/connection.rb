module ApplicationCable
  # We are identifying connections with locale and current user
  # Why locale? Because otherwise, the same user with different locale
  # settings might have random language switches
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :locale

    def connect
      self.current_user = find_verified_user
      self.locale = request.session["locale"]
    end

    private

    def find_verified_user
      verified_user = User.find_by(id: request.session["user_id"])

      verified_user || reject_unauthorized_connection
    end
  end
end
