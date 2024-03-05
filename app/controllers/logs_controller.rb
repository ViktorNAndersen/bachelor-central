class API::V1::LogsController < ApplicationController
  def index
    @q = Log.ransack(params[:q])
    @orders = @q.result
    render json: @users
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: { errors: @order.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @order = order.find(params[:id])
    @order.destroy
    head :no_content
  end
end
