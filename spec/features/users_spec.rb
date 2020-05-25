require "rails_helper"

RSpec.feature "Users" do
  it "should toggle the status of a user" do
    users = create_list(:user, 3, status: "unavailable")
    user = users.first
    login_user(user)

    visit root_path
    click_on(user.username)

    expect(page).to have_content(I18n.t("users.available"))
    user.reload
    expect(user).to be_available
  end

  it "should toggle the duty_type of a user" do
    users = create_list(:user, 3, duty_type: nil)
    user = users.first
    login_user(user)

    visit root_path
    find_button(user.username).right_click

    expect(page).to have_content(I18n.t("users.picket"))
    user.reload
    expect(user).to be_picket
  end

  it "is in sync with the status toggles of other users" do
    users = create_list(:user, 3, status: "unavailable", duty_type: nil)
    first_user = users.first
    second_user = users.second

    within_first_window do
      login_user(first_user)
      visit root_path
    end

    within_second_window do
      login_user(second_user)
      visit root_path
    end

    within_first_window do
      click_on(first_user.username)
      expect(page).to have_content(I18n.t("users.available"))
    end

    within_second_window do
      expect(page).to have_content(I18n.t("users.available"))
    end
  end

  it "is in sync with the duty type toggles of other users" do
    users = create_list(:user, 3, status: "unavailable", duty_type: nil)
    first_user = users.first
    second_user = users.second

    within_first_window do
      login_user(first_user)
      visit root_path
    end

    within_second_window do
      login_user(second_user)
      visit root_path
    end

    within_first_window do
      find_button(first_user.username).right_click
      expect(page).to have_content(I18n.t("users.picket"))
    end

    within_second_window do
      expect(page).to have_content(I18n.t("users.picket"))
    end
  end

  private

  def within_first_window
    yield
  end

  def within_second_window
    Capybara.using_driver(:selenium_chrome_private) do
      yield
    end
  end
end
