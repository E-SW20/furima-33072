class PurchasesController < ApplicationController

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create

    @purchase_form = PurchaseForm.new(set_purchase)
    if @purchase_form.valid?
      @purchase_form.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def set_purchase
    params.require(:purchase_form)
          .permit(:postal_code, :prefectures_id, :municipality, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id ,item_id: params[:item_id])
  end
end
