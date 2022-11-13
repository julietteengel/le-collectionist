class OpeningHour < ApplicationRecord
  belongs_to :shop
  validates_presence_of :day, :closes_at, :opens_at
  validate :opens_before_closes
  validate :not_overlapping_another_opening_hour?

  enum day: {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  scope :for_shop, -> (shop) { where(shop: shop) }
  scope :for_day, -> (day) { where(day: day) }

  scope :overlapping, -> (start_time, end_time) { where("opens_at <= ? AND ? <= closes_at", end_time, start_time) }

  private

  def opens_before_closes
    errors.add(:base, I18n.t(:opens_before_closes, scope: 'activerecord.errors.models.shop')) if opens_at && closes_at && opens_at >= closes_at
  end

  def overlapping_opening_hours
    OpeningHour.for_shop(shop).for_day(day).overlapping(opens_at, closes_at)
  end

  def not_overlapping_another_opening_hour?
    return true if overlapping_opening_hours.empty? # early-return if no overlap
    
    errors.add(:base, I18n.t(:has_overlapping_opening_hours, scope: 'activerecord.errors.models.shop'))
    false
  end
end