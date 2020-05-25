module AuthHelpers
  module Request
    def login_user(user)
      params = { user: { username: user.username, password: "foobar" } }

      send(:post, login_path, params: params)
    end

    def logout
      send(:delete, logout_path)
    end
  end

  module Feature
    def login_user(user)
      visit login_path
      fill_in("Username", with: user.username)
      fill_in("Password", with: "foobar")
      click_on("Login")
      page.has_content?("Login successful")
    end

    def logout
      page.driver.submit(:delete, logout_path)
    end
  end
end
