class ReceiptsController < ApplicationController
  # before_action :find_order, only: [:create]

    def create
        @order = Order.find(params[:order_id])
        @receipt = Receipt.new(receipt_params)
        @receipt.order = @order
        @receipt.tprice = (@receipt.kilos * @receipt.ppfruit)
        addorderprice
        if @receipt.save
          redirect_to order_path(@order)
          else
           render :new
        end
      end

    def addorderprice
      @order.price += @receipt.tprice
      @employee += @receipt.tprice
    end

      # DELETE /orders/1 FUCKING WORK ON THIS CAUSE IT DOESNT WORK- PARAMS CANNOT FIND ID BLABLABLA

    def destroy
      @order = Order.find(params[:id])
      @receipt = Receipt.find(params[:id])
      @receipt.destroy
      redirect_to root_path
    end

    
      private
    
      def receipt_params
        params.require(:receipt).permit(:kilos, :fruit, :ppfruit, :tprice, :receipt_id, orders_attributes: [:order_id, :price], employees_attributes: [:client_id, :credit] )
      end

 
      def find_order
        @order = Order.find(params[:id])
      end

      def find_employee
        @employee = Employee.find(params[:id])
      end
end
