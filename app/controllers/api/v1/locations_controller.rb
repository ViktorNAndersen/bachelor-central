class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]
  def index
    @units = Unit.all
    @suppliers = Supplier.all
    render json: { units: @units, suppliers: @suppliers }
  end

  def show
    employees = @location.users.map do |employee|
      {
        id: employee.id,
        email: employee.email
      }
    end

    quantities = @location.stock.quantities.map do |quantity|
      {
        quantity: quantity.amount,
        product: Product.find(quantity.product_id)
      }
    end
    render json: @location.attributes.merge(quantities: quantities).merge(employees: employees)
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      render json: @location, status: :created
    else
      render json: { errors: @location.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @location.update(location_params)
      render json: @location, status: :ok
    else
      render json: { errors: @location.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @location.destroy
    head :no_content
  end

  private
  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit()
  end

end