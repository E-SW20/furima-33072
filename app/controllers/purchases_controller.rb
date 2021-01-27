class PurchasesController < ApplicationController

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @address = Address.new(address_params)
    @address.save

  end

  private

  def メソッド名
    params.permit(指定のカラムを記述する)
  end
end
