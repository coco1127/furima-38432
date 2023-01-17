class PurchasesController < ApplicationController
  def index
   @item = Item.find(params[:item_id])
   @purchase_shipping = PurchaseShipping.new
                 
    
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path 
    else
      render :index
    end
  end


  private

  def purchase_params
    params.require(:purchase_shipping).permit(:user_id, :item_id, :post_code, :city, :house_number, :building_name, :phone_number,:trading_status_id,:purchase_history_id).merge(user_id: current_user.id, item_id: @item.id)


  end
end