class OrdersController < ApplicationController

  def index
    @order_payment = OrderPayment.new
    @item = Item.find(params[:item_id])
  end

end
