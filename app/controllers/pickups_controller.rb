class PickupsController < ApplicationController

  before_action :set_pickup, only: [:show, :edit, :update, :destroy]
  
  def index
    @pickups = Pickup.all
  end

  # GET /landlonds/1
  def show
  end

  # GET /landlonds/new
  def new
    @pickup = Pickup.new    
  end

  # GET /landlonds/1/edit
  def edit
  end

  # POST /landlonds
  def create
    @pickup = Pickup.new(pickup_params)
    @pickup.cost = 0
    @pickup.kgs = 0
    @pickup.cost += @pickup.addcost
    if @pickup.save
      redirect_to @pickup, notice: 'pickup was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /landlonds/1
  def update
    if @pickup.update(pickup_params)
      redirect_to @pickup, notice: 'pickup was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /landlonds/1
  def destroy
    @pickup.destroy
    redirect_to landlonds_url, notice: 'pickup was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_pickup
    @pickup = Pickup.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pickup_params
    params.require(:pickup).permit(:landlord_id, :date, :cost, :comment, :addcost, :kgs)
  end

end
