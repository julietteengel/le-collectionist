require 'rails_helper'

RSpec.describe OpeningHour, type: :model do

  let(:opening_hour) { create(:opening_hour) }

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
  end

end