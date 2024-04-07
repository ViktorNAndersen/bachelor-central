class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result
    render json: @orders
  end

  def show
    order_items = @order.order_items.map do |order_item|
      {
        quantity: order_item.quantity,
        product: Product.find(order_item.product_id)
      }
    end

    render json: @order.attributes.merge(order_items: order_items)
  end

  def create
    @order = Order.new(order_params)
    @order.total_price = @order.order_items.map { |order_item| order_item.product.price * order_item.quantity }.sum
    if @order.save
      update_stock
      @order.update_attribute(:status, 1)
      render json: @order, status: :created
    else
      render text: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, status: :ok
    else
      render text: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:ordered_by_id, :status, :total_price, order_items_attributes: [:product_id, :quantity])
  end

  def update_stock
    stock = User.find(@order.ordered_by_id)&.unit&.supplier&.stock

    @order.order_items.each do |order_item|
      product = Product.find(order_item.product_id)
      quantity = stock.quantities.find_by(product_id: product.id)
      quantity.update_attribute(:amount, quantity.amount - order_item.quantity)
    end
  end
end
