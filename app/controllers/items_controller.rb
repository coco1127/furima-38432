class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item, only: [:edit, :show, :update]

  def index
    @items = Item.order('created_at DESC')
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

  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user.id
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_condition_id, :preparation_day_id, :postage_payer_id, :category_id,
                                 :trading_status_id, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
