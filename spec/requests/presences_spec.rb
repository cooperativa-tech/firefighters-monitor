require "rails_helper"

RSpec.describe PresencesController, type: :request do
  describe "GET #index" do
    it "renders the users" do
      users = create_list(:user, 3, :admin)
      login_user(users.first)

      get presences_path

      users.each do |user|
        expect(response.body).to include(user.username)
      end
    end

    it "gives a not found error if user is not an admin" do
      users = create_list(:user, 3)
      login_user(users.first)

      expect do
        get presences_path
      end.to raise_error(ActionController::RoutingError)
    end

    it "sends user to login screen if not logged in" do
      get presences_path

      expect(response).to redirect_to(login_path)
    end
  end
end
