class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  #def create
  #end
end
