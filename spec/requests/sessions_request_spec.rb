require "rails_helper"

RSpec.describe "Sessions", type: :request do
  describe "GET #new" do
    it "has a 200 status code" do
      get login_path

      expect(response.status).to eq(200)
    end

    it "redirects to users_path if already logged in" do
      user = create(:user)
      login_user(user)

      get login_path

      expect(response).to redirect_to(users_path)
    end
  end

  describe "POST #create" do
    it "redirects to users_path on a successful login" do
      user = create(:user)

      post login_path, params: { user: { email: user.email, password: "foobar" } }

      expect(response).to redirect_to(users_path)
    end

    it "renders the login template if login is bad" do
      user = create(:user)

      post login_path, params: { user: { email: user.email, password: "bad_password" } }

      expect(response).to render_template(:new)
      expect(response).to have_http_status(:unauthorized)
    end
  end

  describe "DELETE #destroy" do
    it "sends user to login screen if not logged in" do
      post logout_path

      expect(response).to redirect_to(login_path)
    end

    it "renders the login template if login is bad" do
      user = create(:user)
      login_user(user)

      post logout_path

      expect(response).to redirect_to(login_path)
      expect(session[:user_id]).to eq(nil)
    end
  end
end
