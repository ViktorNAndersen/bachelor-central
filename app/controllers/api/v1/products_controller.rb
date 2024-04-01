class Api::V1::ProductsController < ApplicationController
  def index
    @q = Product.ransack(params[:q])
    @products = @q.result
    render json: @products
  end
end