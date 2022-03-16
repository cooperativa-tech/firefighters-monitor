require "rails_helper"

RSpec.describe PresencesController do
  describe "GET #index" do
    it "renders the users" do
      users = create_list(:user, 3, :admin)
      login_user(users.first)

      get presences_path

      users.each do |user|
        expect(response.body).to include(user.username)
      end
    end

    it "redirects to root if not admin" do
      users = create_list(:user, 3)
      login_user(users.first)

      get presences_path

      expect(response).to redirect_to(root_path)
    end

    it "sends user to login screen if not logged in" do
      get presences_path

      expect(response).to redirect_to(login_path)
    end
  end
end
