class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_item, only: [:show, :update, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    flash[:notice] = '出品が完了しました。'
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      flash[:notice] = '商品情報を更新しました。'
      redirect_to item_path, method: :get
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = '削除しました。'
    redirect_to root_path
  end

  private

  def item_params
    params[:item].permit(:title, :text, :category_id, :product_status_id, :shipping_charges_id, :shipping_area_id,
                         :days_to_ship_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user.id && @item.order.nil?
  end
end
