class OrdersController < ApplicationController

  def index
    @order_payment = OrderPayment.new
  end

end
