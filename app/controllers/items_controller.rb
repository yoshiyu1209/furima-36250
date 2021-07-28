class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @items = Item.order('created_at DESC')
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

  def show
    @item = Item.find(params[:id])
  end


  private

  def item_params
    params[:item].permit(:image, :title, :text, :category_id, :product_status_id, :shipping_charges_id, :shipping_area_id,
                         :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
