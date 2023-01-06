class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    #@items = Item.order("created_at DESC")       一覧機能
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
  else 
    render :new
  end
  end

  private

  def item_params
    params.require(:item).permit(:name,:introduction,:price,:item_condition_id,:preparation_day_id,:postage_payer_id,:category_id,:trading_status_id,:image).merge(user_id: current_user.id)

  end

end