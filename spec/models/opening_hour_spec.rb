require 'rails_helper'

RSpec.describe OpeningHour, type: :model do

  let(:opening_hour) { build(:default_opening_hour ) }
  let(:opening_hour_closes_before_opens) { build(:opening_hour_closes_before_opens) }
  let(:opening_hour_overlapping_opening_hours) { build(:opening_hour_overlapping_opening_hours) }

  context "Factory" do
    it "has a valid factory" do
      expect(opening_hour).to be_valid
    end
    it "is invalid without a day assigned" do
      shop = build(:opening_hour, day: nil)
      expect(shop).to_not be_valid
    end
    it "is invalid without a opens_at assigned" do
      shop = build(:opening_hour, opens_at: nil)
      expect(shop).to_not be_valid
    end
    it "is invalid without a closes_at assigned" do
      shop = build(:opening_hour, closes_at: nil)
      expect(shop).to_not be_valid
    end

    context 'with opening hour closes before opens' do
      it "is invalid" do
        expect(opening_hour_closes_before_opens).to be_invalid
      end
    end
  end

end