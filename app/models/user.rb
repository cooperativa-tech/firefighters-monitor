class User < ApplicationRecord
  include CableReady::Broadcaster
  before_validation :set_random_password

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

  default_scope { order(sort_index: :asc) }

  def next_status
    next_enum(User.statuses, status)
  end

  def next_duty_type
    next_enum(User.duty_types.merge(nil: nil), duty_type)
  end

  private

  def set_random_password
    return if self.admin? || self.password.present?
    self.password = SecureRandom.hex
    self.password_confirmation = self.password
  end

  def next_enum(enum, current_value)
    enum_index = current_value ? enum.keys.index(current_value) : -1
    is_last_index = enum_index == enum.keys.length - 1
    new_enum_index = is_last_index ? 0 : enum_index + 1
    new_enum_key = enum.keys[new_enum_index]

    enum[new_enum_key]
  end
end
