require "rails_helper"

RSpec.feature "Presences", js: true do
  it "should toggle the status of a user" do
    create_list(:user, 3)
    user = create(:user, :admin, status: "unavailable")
    login_user(user)

    visit presences_path
    click_on(user.username)

    expect(page).to have_selector(".Presences-user", text: User.human_enum_name(:status, :available))
    user.reload
    expect(user).to be_available
  end

  it "should toggle the duty_type of a user" do
    create_list(:user, 3)
    user = create(:user, :admin, duty_type: nil)
    login_user(user)

    visit presences_path
    find_button(user.username).right_click

    expect(page).to have_selector(".Presences-user", text: User.human_enum_name(:duty_type, :picket))
    user.reload
    expect(user).to be_picket
  end

  it "is in sync with the status toggles of other users" do
    users = create_list(:user, 3, :admin, status: "unavailable", duty_type: nil)
    first_user = users.first
    second_user = users.second

    within_first_window do
      login_user(first_user)
      visit presences_path
    end

    within_second_window do
      login_user(second_user)
      visit presences_path
    end

    within_first_window do
      click_on(first_user.username)
      expect(page).to have_selector(".Presences-user", text: User.human_enum_name(:status, :available))
    end

    within_second_window do
      expect(page).to have_selector(".Presences-user", text: User.human_enum_name(:status, :available))
    end
  end

  it "is in sync with the duty type toggles of other users" do
    users = create_list(:user, 3, :admin, status: "unavailable", duty_type: nil)
    first_user = users.first
    second_user = users.second

    within_first_window do
      login_user(first_user)
      visit presences_path
    end

    within_second_window do
      login_user(second_user)
      visit presences_path
    end

    within_first_window do
      find_button(first_user.username).right_click
      expect(page).to have_selector(".Presences-userDutyType", text: User.human_enum_name(:duty_type, :picket))
    end

    within_second_window do
      expect(page).to have_selector(".Presences-userDutyType", text: User.human_enum_name(:duty_type, :picket))
    end
  end

  private

  def within_first_window
    yield
  end

  def within_second_window(&block)
    Capybara.using_driver(:selenium_chrome_private, &block)
  end
end
