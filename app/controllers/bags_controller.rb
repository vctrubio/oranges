class BagsController < ApplicationController

        before_action :set_bag, only: [:show, :edit, :update, :destroy]
        
        def index
          @bags = Bag.all
        end
      
        # GET /landlonds/1
        def show
        end
      
        # GET /landlonds/new
        def new
          @bag = Bag.new
          b = params[:format]
          @bag.pickup_id = b
          
        end
      
        # GET /landlonds/1/edit
        def edit
        end
      
        # POST /landlonds
        def create
          @bag = Bag.new(bag_params)
          addcost
          if @bag.save
            redirect_to pickup_path(@bag.pickup), notice: 'bag was successfully created.'
          else
            render :new
          end
        end
      
        def addcost
          @bag.pickup.cost += @bag.price
          @bag.pickup.kgs += @bag.quantity
        end

        # PATCH/PUT /landlonds/1 
        def update
          if @bag.update(bag_params)
            redirect_to @bag, notice: 'bag was successfully updated.'
          else
            render :edit
          end
        end
      
        # DELETE /landlonds/1
        def destroy
          @bag.destroy
          redirect_to landlonds_url, notice: 'bag was successfully destroyed.'
        end
      
        private
        # Use callbacks to share common setup or constraints between actions.
        def set_bag
          @bag = Bag.find(params[:id])
        end
      
        # Only allow a trusted parameter "white list" through.
        def bag_params
          params.require(:bag).permit(:pickup_id, :quantity, :price, :fruit, pickups_attributes: [:landlord_id, :date, :cost, :kgs])
        end
            
end
