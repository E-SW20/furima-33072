class PurchasesController < ApplicationController

  def index
    @purchase_form = PurchaseForm.new
    @item = Item.find(params[:item_id])
  end

  def create

  end

end
