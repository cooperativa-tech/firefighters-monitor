module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user, :unique_hash

    def connect
      self.current_user = find_verified_user
      self.unique_hash = SecureRandom.hex(64)
    end

    private

    def find_verified_user
      verified_user = User.find_by(id: request.session["user_id"])

      verified_user || reject_unauthorized_connection
    end
  end
end
