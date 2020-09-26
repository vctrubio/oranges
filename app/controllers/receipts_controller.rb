class ReceiptsController < ApplicationController

    def create
        @order = Order.find(params[:order_id])
        @receipt = Receipt.new(receipt_params)
        @receipt.order = @order
        if @receipt.save
          redirect_to order_path(@order)
        #else
          #render "order/show"
        end
      end
    
      private
    
      def receipt_params
        params.require(:receipt).permit(:kilos, :fruit, :ppfruit, :tprice)
      end
end
