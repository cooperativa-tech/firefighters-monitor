class Schedule
  include ActiveModel::Model

  validates :start_date, :end_date, :status, presence: true
  validate :start_date_before_end_date

  attr_accessor :status
  attr_reader :start_date, :end_date

  def start_date=(start_date)
    return if start_date.blank?

    @start_date = Time.parse(start_date.to_s).utc
  end

  def end_date=(end_date)
    return if end_date.blank?

    @end_date = Time.parse(end_date.to_s).utc
  end

  private

  def start_date_before_end_date
    return unless start_date && end_date

    errors.add(:start_date, "should be before the end date") unless start_date < end_date
  end
end
