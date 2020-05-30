class Schedule
  include ActiveModel::Model

  attr_accessor :date, :duty_type, :status

  validates :date, presence: true
end
