FactoryBot.define do
  factory :opening_hour do
    # relations
    association :shop

    day { %i[sunday monday tuesday wednesday thursday friday saturday].sample }

    factory :default_opening_hour do
      opens_before_closes
    end

    factory :opening_hour_closes_before_opens do
      closes_before_opens
    end

    factory :opening_hour_overlapping_opening_hours do
      overlapping
    end

    trait :opens_before_closes do
      # attributes
      t1 = Time.parse("10:30")
      t2 = Time.parse("15:00")
      t3 = Time.parse("17:30")
      t4 = Time.parse("20:00")
      opens_at { rand(t1..t2) }
      closes_at { rand(t3..t4) }
    end

    trait :closes_before_opens do
      # attributes
      t1 = Time.parse("10:30")
      t2 = Time.parse("15:00")
      t3 = Time.parse("17:30")
      t4 = Time.parse("20:00")
      opens_at { rand(t3..t4) }
      closes_at { rand(t1..t2) }
    end

    trait :overlapping do
      t1 = Faker::Time.between(from: Time.zone.parse('00:00'), to: Time.zone.parse('15:00'))
      max = Time.zone.parse('10:30') > t1 ? Time.zone.parse('10:30') : t1
      t2 = Faker::Time.between(from: max, to: Time.zone.parse('23:59'))
      # where('opens_at <= ? AND ? <= closes_at', end_time, start_time)
      opens_at { t1 }
      closes_at { t2 }
    end
  end
end