Rake::Task["db:reset"]

# Shops
shop = Shop.create(name: "L'Épicerie Du Coin")

# Hours
[:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday].each do |day|
  if day == :sunday
    OpeningHour.create(
      day: day,
      shop_id: shop.id,
      opens_at: nil,
      closes_at: nil
    )
  elsif day == :saturday
    OpeningHour.create(
      day: day,
      shop_id: shop.id,
      opens_at: Time.parse("10:30"),
      closes_at: Time.parse("20:00")
    )
  else
    OpeningHour.create(
      day: day,
      shop_id: shop.id,
      opens_at: Time.parse("10:30"),
      closes_at: Time.parse("15:00")
    )
    OpeningHour.create(
      day: day,
      shop_id: shop.id,
      opens_at: Time.parse("17:00"),
      closes_at: Time.parse("20:00")
    )
  end
end