# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'shops/index', type: :view do
  let(:shop_with_hours) { create(:shop_with_hours) }

  before do
    assign(:shop, shop_with_hours)
    assign(:shops, Shop.all)
  end
  
  it 'renders a list of all shops' do
    render
    # A line for each shop
    expect(rendered).to have_selector('li', count: Shop.all.count)
  end
end
