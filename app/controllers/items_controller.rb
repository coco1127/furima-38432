class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:item_condition_id,:preparation_day_id,:postage_payer_id,:category_id,:trading_status_id,:image).merge(user_id: current_user.id)

  end

end