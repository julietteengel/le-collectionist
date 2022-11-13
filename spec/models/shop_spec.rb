# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Shop, type: :model do
  let(:shop) { create(:shop_with_hours) }

  context 'Factory' do
    it 'has a valid factory' do
      expect(shop).to be_valid
    end
    it 'is invalid without a name' do
      shop = build(:shop, name: nil)
      expect(shop).to_not be_valid
    end
    it 'should have many hours' do
      h = Shop.reflect_on_association(:opening_hours)
      expect(h.macro).to eq(:has_many)
    end
  end
end
