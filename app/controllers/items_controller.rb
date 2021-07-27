class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params[:item].permit(:image, :title, :text, :category_id, :product_status_id, :shipping_charges_id, :shipping_area_id,
                         :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
