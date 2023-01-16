class PurchasesController < ApplicationController
  def index
   @item = Item.find(params[:item_id])
   @shipping_address = ShippingAddress.new
    
  end

  def create
    @item = Item.find(params[:item_id])
    @shipping_address = ShippingAddress.new
    if @shipping_address.valid?
      @shipping_address.save
      redirect_to root_path 
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:shipping_address).permit(:post_code, :city, :house_number, :building_name, :phone_number,:trading_status_id, :purchase_history).merge(user_id: current_user.id, item_id: @item.id)
  end
end