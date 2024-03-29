class Api::V1::LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]
  def index
    @q = Log.ransack(params[:q])
    @logs = @q.result
    render json: @logs
  end

  def show
    render json: @log
  end

  def create
    @log = Log.new(log_params)
    if @log.save
      render json: @log, status: :created
    else
      render json: { errors: @log.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @log.update(log_params)
      render json: @log, status: :ok
    else
      render json: { errors: @log.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @log.destroy
    head :no_content
  end

  private
  def set_log
    @log = log.find(params[:id])
  end

  def log_params
    params.require(:log).permit()
  end

end
