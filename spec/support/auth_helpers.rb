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
    def login_user(user, current_page = page)
      current_page.visit login_path
      current_page.fill_in("Username", with: user.username)
      current_page.fill_in("Password", with: "foobar")
      current_page.click_on("Login")
      current_page.has_content?("Login successful")
    end

    def logout(current_page = page)
      current_page.driver.submit(:delete, logout_path)
    end
  end
end
