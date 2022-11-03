class ShopsController < ApplicationController
  before_action :set_shop, only: :show

  def index
    @shops = Shop.all
  end

  def show
    @organized_array = Array(0..6).rotate(Date.today.wday)
  end

  private

  def set_shop
    @shop = Shop.find(params[:id])
  end
end