# frozen_string_literal: true

Rake::Task['db:reset']

# Shops
shop = Shop.create(name: "L'Épicerie Du Coin")

# Hours
%i[monday tuesday wednesday thursday friday saturday].each do |day|
  if day == :saturday
    OpeningHour.create(
      day:,
      shop_id: shop.id,
      opens_at: Time.zone.parse('10:30'),
      closes_at: Time.zone.parse('20:00')
    )
  else
    OpeningHour.create(
      day:,
      shop_id: shop.id,
      opens_at: Time.zone.parse('10:30'),
      closes_at: Time.zone.parse('15:00')
    )
    OpeningHour.create(
      day:,
      shop_id: shop.id,
      opens_at: Time.zone.parse('17:00'),
      closes_at: Time.zone.parse('20:00')
    )
  end
end
