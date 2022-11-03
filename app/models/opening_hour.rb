class OpeningHour < ApplicationRecord
  belongs_to :shop
  validates_presence_of :day, :closes_at, :opens_at
  validate :opens_before_closes

  enum day: {
    sunday: 0,
    monday: 1,
    tuesday: 2,
    wednesday: 3,
    thursday: 4,
    friday: 5,
    saturday: 6
  }

  private

  def opens_before_closes
    errors.add(:base, I18n.t(:opens_before_closes, scope: 'activerecord.errors.models.opening_hour')) if opens_at && closes_at && opens_at >= closes_at
  end
end