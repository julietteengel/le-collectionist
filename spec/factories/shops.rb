# frozen_string_literal: true

FactoryBot.define do
  factory :shop do
    name { "#{Faker::Company.buzzword}_#{Time.current.to_i}" }

    factory :shop_with_hours do
      opening_hours { [association(:default_opening_hour)] }
    end
  end
end
