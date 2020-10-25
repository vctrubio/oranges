class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_client, only: [:new]
  before_action :new_receipt, only: [:show]
  before_action :new_total, only: [:addtotal, :create, :update]


  # GET /orders
  def index
    @orders = Order.all
  end

  # GET /orders/1
  def show
  end

  # GET /orders/new
  def new
    # if !Client.find(params[:client_id]).nil?
    #   @client = Client.find(params[:client_id])
    # else
      
    # end
    @order = Order.new
    @order.client = @client 
  #  wtf is thshit @order.tickets.build ur mama was a rilling stone
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  def create
    @order = Order.new(order_params)
    @order.price = 0
    if @order.receipts.nil?
      @order.price = (@order.receipts.tprice.sum)
    end
    if @order.save
      addtotal
      redirect_to @order
    else
      render :new
    end
  end
#here the addtotal works for the create but not for the update¿?
  def addtotal
    @total.order_id = @order.id
    @total.inflow = @order.price
    @total.save
  end

  # PATCH/PUT /orders/1
  def update
    addtotal
    if @order.update(order_params)
      redirect_to @order, notice: 'Order was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url, notice: 'Order was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:client_id, :date, :price, :comment, :delivered, :paid, receipts_attributes: [:order_id, :kg, :fruit, :ppfruit, :tprice] )
    end

#tickets_attributes: [:order_id, :kg, :fruit, :ppfruit, :tprice]
    def set_client
      @client = Client.find(params[:client_id])
    end  
    
    def  find_employee
      @employee = Employee.find(params[:employee_id])
    end     
    
    def new_receipt
      @receipt = Receipt.new
    end

    def new_total
      @total = Total.new
    end
end
