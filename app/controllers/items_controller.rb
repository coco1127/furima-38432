class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
    
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.new(item_params)
    if @items .save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:item_condition_id,:preparation_day_id,:postage_payer_id,:category_id,:trading_status_id)
  end

end