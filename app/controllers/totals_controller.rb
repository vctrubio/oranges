class TotalsController < ApplicationController
  before_action :set_total, only: [:show, :edit, :update, :destroy]

  # GET /totals
  def index
    @totals = Total.all
  end

  # GET /totals/1
  def show
  end

  # GET /totals/new
  def new
    @total = Total.new
  end

  # GET /totals/1/edit
  def edit
  end

  # POST /totals
  def create
    @total = Total.new(total_params)

    if @total.save
      redirect_to @total, notice: 'Total was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /totals/1
  def update
    if @total.update(total_params)
      redirect_to @total, notice: 'Total was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /totals/1
  def destroy
    @total.destroy
    redirect_to totals_url, notice: 'Total was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_total
      @total = Total.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def total_params
      params.require(:total).permit(:payment_id, :order_id, :pickup_id, :inflow, :outflow, :balance)
    end
end
