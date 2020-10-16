class LandlordsController < ApplicationController
  before_action :set_landlord, only: [:show, :edit, :update, :destroy]
  # before_action :set_pickup, 

  # GET /landlonds
  def index
    @landlords = Landlord.all
    @pickups = Pickup.all
    @bags = Bag.all
    @payment = Payment.new
  end

  # GET /landlonds/1
  def show
  end

  # GET /landlonds/new
  def new
    @landlord = Landlord.new
  end

  # GET /landlonds/1/edit
  def edit
  end

  # POST /landlonds
  def create
    @landlord = Landlord.new(landlord_params)
    if @landlord.save
      redirect_to @landlord, notice: 'landlord was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /landlonds/1
  def update
    if @landlord.update(landlord_params)
      redirect_to @landlord, notice: 'landlord was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /landlonds/1
  def destroy
    @landlord.destroy
    redirect_to landlonds_url, notice: 'landlord was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_landlord
      @landlord = Landlord.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def landlord_params
      params.require(:landlord).permit(:name, :address, :phone, :description, :fields)
    end
end
