require "rails_helper"

RSpec.describe "shops/show", type: :view do

  let(:shop_with_hours) { create(:shop_with_hours) }
  let(:organized_array) { Array(0..6).rotate(Time.zone.today.wday) }

  before do
    assign(:shop, shop_with_hours)
    assign(:organized_array, organized_array)
  end

  it "renders a list of opening hours for each day of the week" do
    render
    expect(rendered).to have_text "#{shop_with_hours.name}"
    # A line for each day of the week
    expect(rendered).to have_selector("tr", count: 7)
    # First line should be today
    expect(rendered).to have_selector("td", class: "today", text: I18n.t("activerecord.attributes.opening_hour.days.#{Date.today.strftime("%A").downcase}"))

  end
end