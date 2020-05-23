require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET #index" do
    it "has a 200 status code" do
      users = create_list(:user, 3)
      login_user(users.first)

      get users_path

      users.each do |user|
        expect(response.body).to include(user.username)
      end
    end

    it "sends user to login screen if not logged in" do
      get users_path

      expect(response).to redirect_to(login_path)
    end
  end
end
