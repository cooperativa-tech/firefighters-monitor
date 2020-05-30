require "rails_helper"

RSpec.feature "Authentication", js: true do
  it "redirects user to login if not logged in" do
    visit root_path

    expect(page).to have_content("Please login first")
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(current_path).to eq(login_path)
  end

  it "logins the user with correct credentials" do
    user = create(:user)

    visit login_path
    fill_in("Username", with: user.username)
    fill_in("Password", with: "foobar")
    click_on("Login")

    expect(page).to have_content("Login successful")
    expect(page).to have_content("Logout")
    expect(current_path).to eq(root_path)
  end

  it "rejects the user's login if the password is bad" do
    user = create(:user)

    visit login_path
    fill_in("Username", with: user.username)
    fill_in("Password", with: "bad password")
    click_on("Login")

    expect(page).to have_content("Login failed")
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(current_path).to eq(login_path)
  end

  it "rejects the user's login if the username is bad" do
    user = create(:user)

    visit login_path
    fill_in("Username", with: "#{user.username}_bad")
    fill_in("Password", with: "bad password")
    click_on("Login")

    expect(page).to have_content("Login failed")
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
    expect(current_path).to eq(login_path)
  end

  it "logs out the user" do
    user = create(:user)
    login_user(user)

    visit root_path
    click_on("Logout")

    expect(page).to have_content("Logged out")
    expect(page).to have_content("Login")
    expect(page).to have_content("Username")
    expect(page).to have_content("Password")
  end
end
