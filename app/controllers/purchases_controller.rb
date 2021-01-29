class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index, :create]
  def index
    @purchase_form = PurchaseForm.new
    redirect_to root_path if current_user.id == @item.user_id || !@item.purchase.nil?
  end

  def create
    @purchase_form = PurchaseForm.new(set_purchase)
    if @purchase_form.valid?
      pay_item
      @purchase_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_purchase
    params.require(:purchase_form)
          .permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: set_purchase[:token],
      currency: 'jpy'
    )
  end
end
