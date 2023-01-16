class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_payment = OrderPayment.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
     redirect_to root_path
    end
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_payment.valid?
      @order_payment.save
      redirect_to root_path
    else
      render :index
    end

  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
