class User < ApplicationRecord
  authenticates_with_sorcery!

  enum role: { regular: "regular", admin: "admin" }
  enum status: { unavailable: "unavailable", available: "available", service: "service" }

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def toggle_status
    status_index = User.statuses.keys.index(status)
    is_last_index = status_index == User.statuses.keys.length - 1
    new_status_index = is_last_index ? 0 : status_index + 1
    new_status = User.statuses.keys[new_status_index]

    self.status = new_status
    save

    new_status
  end
end
