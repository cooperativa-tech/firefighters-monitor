class Schedule
  include ActiveModel::Model

  validates :start_date, :end_date, :status, presence: true
  validates :start_date, timeliness: { before: :end_date, type: :datetime }

  attr_accessor :status
  attr_reader :start_date, :end_date

  def start_date=(start_date)
    return if start_date.blank?

    @start_date = Time.parse(start_date).utc
  end

  def end_date=(end_date)
    return if end_date.blank?

    @end_date = Time.parse(end_date).utc
  end
end
