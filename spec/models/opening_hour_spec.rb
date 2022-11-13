# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OpeningHour, type: :model do
  let(:shop) { create(:shop) }
  let(:opening_hour) { build(:default_opening_hour) }
  let(:opening_hour_with_fixed_hours) { build(:opening_hour_with_fixed_hours) }
  let(:opening_hour_closes_before_opens) { build(:opening_hour_closes_before_opens) }
  let(:opening_hour_overlapping_opening_hours) { build(:opening_hour_overlapping_opening_hours, shop_id: shop.id) }

  context 'Factory' do
    it 'has a valid factory' do
      expect(opening_hour).to be_valid
    end
    it 'is invalid without a day assigned' do
      shop = build(:opening_hour, day: nil)
      expect(shop).to_not be_valid
    end
    it 'is invalid without a opens_at assigned' do
      shop = build(:opening_hour, opens_at: nil)
      expect(shop).to_not be_valid
    end
    it 'is invalid without a closes_at assigned' do
      shop = build(:opening_hour, closes_at: nil)
      expect(shop).to_not be_valid
    end

    context 'with opening hour closes before opens' do
      it 'is invalid' do
        expect(opening_hour_closes_before_opens).to be_invalid
      end
    end

    context 'with overlapping hours' do
      let!(:opening_hour) do
        create(:opening_hour_with_fixed_hours, day: opening_hour_overlapping_opening_hours.day, shop_id: shop.id)
      end
      it 'exists one overlapping record in test database' do
        expect(opening_hour_overlapping_opening_hours.day).to eq(opening_hour.day)
        expect(OpeningHour.for_shop(shop).for_day(opening_hour.day).overlapping(
          opening_hour_overlapping_opening_hours.opens_at, opening_hour_overlapping_opening_hours.closes_at
        ).count).to eq(1)
      end
      it 'is invalid' do
        expect(opening_hour_overlapping_opening_hours).to_not be_valid
      end
    end
  end
end
