module AuthHelpers
  def login_user(user)
    send(:post, login_path, params: { user: { email: user.email, password: "foobar" } })
  end
end
