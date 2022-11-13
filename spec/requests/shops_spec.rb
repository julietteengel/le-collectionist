# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Shops', type: :request do
  let(:shop_with_hours) { create(:shop_with_hours) }

  describe 'GET /show' do
    it 'renders a successul response' do
      %w[fr en].each do |locale|
        get "/#{locale}/shops/#{shop_with_hours.id}"
        expect(response).to be_successful
      end
    end

    describe 'GET /index' do
      it 'renders a successul response' do
        %w[fr en].each do |locale|
          get "/#{locale}/shops/"
          expect(response).to be_successful
        end
      end
    end
  end
end
