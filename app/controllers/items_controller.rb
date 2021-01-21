class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @item = Item.all.order("created_at DESC")
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
    params.require(:item).permit(:image,:name,:explanation,:category_id,:state_id,:delivery_price_id,:prefectures_id,:delivery_time_id,:price).merge(user_id: current_user.id)
  end
end
