class API::V1::UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def index
    @q = User.ransack(params[:q])
    @orders = @q.result
    render json: @users
  end

  def create
    @user = Employee.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    head :no_content
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role, :location_id)
  end
end
