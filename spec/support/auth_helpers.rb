module AuthHelpers
  def login_user(user)
    send(:post, login_path, params: { user: { username: user.username, password: "foobar" } })
  end
end
