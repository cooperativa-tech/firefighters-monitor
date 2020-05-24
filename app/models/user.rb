class User < ApplicationRecord
  include CableReady::Broadcaster

  authenticates_with_sorcery!

  enum role: { regular: "regular", admin: "admin" }
  enum status: { unavailable: "unavailable", available: "available", service: "service" }
  enum duty_type: {
    picket: "picket",
    elac: "elac",
    eip: "eip"
  }

  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  def toggle_status
    self.status = toggle_enum(User.statuses, status)

    save
  end

  def toggle_duty_type
    self.duty_type = toggle_enum(User.duty_types.merge(nil: nil), duty_type)

    save
  end

  private

  def toggle_enum(enum, current_value)
    enum_index = current_value ? enum.keys.index(current_value) : -1
    is_last_index = enum_index == enum.keys.length - 1
    new_enum_index = is_last_index ? 0 : enum_index + 1
    new_enum_key = enum.keys[new_enum_index]

    enum[new_enum_key]
  end
end
