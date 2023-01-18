class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order_payment = OrderPayment.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
      redirect_to root_path
    elsif current_user != @item.user && @item.order.present?
      redirect_to root_path
    end
  end

  def create
    @order_payment = OrderPayment.new(order_params)
    @item = Item.find(params[:item_id])
    if @order_payment.valid?

      pay_item

      @order_payment.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_payment).permit(:postcode, :prefecture_id, :city, :block, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
