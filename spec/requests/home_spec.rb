require "rails_helper"

RSpec.describe HomeController do
  describe "GET #index" do
    it "renders the home page" do
      user = create(:user, :admin)
      login_user(user)

      get root_path

      expect(response.body).to include("Hello World!")
    end
  end
end
