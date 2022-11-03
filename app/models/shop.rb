class Shop < ApplicationRecord
  has_many :opening_hours, dependent: :destroy
  validates :name, presence: :true

  def open?(wday)
    opening_hours.where(day: wday).any?
  end

  def opening_hour_string(wday)
    if open?(wday)
      string = ""
      hours_on_date = opening_hours.group_by{ |c| c.day }.select{ |k, v| wday == OpeningHour.days[k] }.values.flatten
      hours_on_date.each do |hour|
        string << I18n.l(hour.opens_at, format: :hour_only) + " - " + I18n.l(hour.closes_at, format: :hour_only)
        string << ", " unless hours_on_date.last == hour
      end
    else
      string = I18n.t(:closed, scope: 'activerecord.attributes.shop')
    end
    string
  end
end