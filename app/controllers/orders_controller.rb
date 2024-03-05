class API::V1::OrdersController < ApplicationController
  
  
  def index
    @q = Order.ransack(params[:q])
    @orders = @q.result
    render json: @orders
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @order.update(order_params)
      render json: @order, status: :ok
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    head :no_content
  end

  private
  def set_order
    @order = order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:ordered_by_id, :status, :total_price, order_items: [:product_id, :quantity])
  end

end
