require "rails_helper"

RSpec.feature "Home Page", js: true do
  it "render a hello world" do
    user = create(:user)
    login_user(user)

    visit root_path

    expect(page).to have_content("Hello World")
    expect(page).to_not have_content(I18n.t("presences"))
  end

  it "renders a link to visit the admin presences page" do
    user = create(:user, :admin)
    login_user(user)

    visit root_path

    expect(page).to have_content("Hello World")
    expect(page).to have_link(I18n.t("presences"))
  end

  it "renders a link to visit the admin presences page" do
    user = create(:user, :admin)
    login_user(user)

    visit root_path
    click_on(I18n.t("presences"))

    expect(current_path).to eq(presences_path)
  end
end
