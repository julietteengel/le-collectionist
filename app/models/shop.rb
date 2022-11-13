# frozen_string_literal: true

class Shop < ApplicationRecord
  has_many :opening_hours, dependent: :destroy
  validates :name, presence: true

  def open?(wday)
    opening_hours.where(day: wday).any?
  end

  def opening_hour_string(wday)
    return build_hour_string(wday) if open?(wday)

    I18n.t(:closed, scope: 'activerecord.attributes.shop')
  end

  private

  def build_hour_string(wday)
    string = ''
    hours_on_date = opening_hours.group_by(&:day).select { |k, _v| wday == OpeningHour.days[k] }.values.flatten
    hours_on_date.each do |hour|
      string += "#{I18n.l(hour.opens_at,
                          format: :hour_only)} - #{I18n.l(hour.closes_at,
                                                          format: :hour_only)}#{hours_on_date.last == hour ? '' : ', '}"
    end
    string
  end
end
