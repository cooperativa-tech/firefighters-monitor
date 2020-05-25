namespace :populate do
  desc "Creates default admin user"
  task admin_user: :environment do
    username = "admin"
    password = Rails.env.production? ? SecureRandom.hex : "foobar"

    unless User.find_by(username: username)
      User.create(
        username: username,
        role: "admin",
        password: password,
        password_confirmation: password,
      )

      puts "Created 'admin' user"
      puts "Password: #{password}"
    end
  end
end
