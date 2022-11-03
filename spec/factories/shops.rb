FactoryBot.define do
  factory :shop do
    name { "#{Faker::Company.buzzword}_#{Time.current.to_i.to_s}" }

    factory :shop_with_hours do
      opening_hours { [association(:opening_hour)] }
    end
  end
end