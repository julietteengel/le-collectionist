FactoryBot.define do
  factory :opening_hour do

    # relations
    association :shop

    # attributes
    t1 = Time.parse("10:30")
    t2 = Time.parse("15:00")
    t3 = Time.parse("17:30")
    t4 = Time.parse("20:00")

    opens_at { rand(t1..t2) }
    closes_at { rand(t3..t4) }
    day { [:sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday].sample }

  end
end