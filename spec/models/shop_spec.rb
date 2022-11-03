require 'rails_helper'

RSpec.describe Shop, type: :model do

  let(:shop) { create(:shop_with_hours) }

  context "Factory" do
    it "has a valid factory" do
      expect(shop).to be_valid
    end
    it "is invalid without a name" do
      shop = build(:shop, name: nil)
      expect(shop).to_not be_valid
    end
  end

end