class ItemsController < ApplicationController

  def index
    @items = 
  end

  
  private

  def item_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end

end
