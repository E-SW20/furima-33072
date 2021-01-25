class ItemsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update]
  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if current_user.id != @item.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  def update
    if @item.update(item_params) && current_user.id == @item.user_id
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :delivery_price_id, :prefectures_id,
                                 :delivery_time_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
