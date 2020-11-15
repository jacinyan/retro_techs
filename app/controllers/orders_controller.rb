class OrdersController < ApplicationController
    # load_and_authorize_resource
    before_action :set_order, only: [:show, :edit, :update, :destroy]

    # GET /orders
    # GET /orders.json
    def index
        @orders = current_user.orders.all
    end

    def show
    end

    # GET /orders/new
    def new
      @order = current_user.orders.build
    end

    # GET /orders/1/edit
    def edit
    end

    def create
        # @order = Order.create(order_params)
        @order = current_user.orders.build(order_params)
        # @order.user_id = current_user.id
        current_cart.order_items.each do |checkout_item|
          checkout_item.order_id = @order.id
          @order.order_items << checkout_item
          checkout_item.cart_id = nil
        end

        @order.save
        respond_to do |format|
          if @order.save
            format.html { redirect_to @order, notice: 'order was successfully created.' }
            format.json { render :show, status: :created, location: @order }
          else
            format.html { render :new }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # PATCH/PUT /orders/1
      # PATCH/PUT /orders/1.json
      def update
        respond_to do |format|
          if @order.update(order_params)
            format.html { redirect_to @order, notice: 'order was successfully updated.' }
            format.json { render :show, status: :ok, location: @order }
          else
            format.html { render :edit }
            format.json { render json: @order.errors, status: :unprocessable_entity }
          end
        end
      end
    
      # DELETE /orders/1
      # DELETE /orders/1.json
      def destroy
        @order.destroy
        respond_to do |format|
          format.html { redirect_to orders_url, notice: 'order was successfully destroyed.' }
          format.json { head :no_content }
        end
      end
    
      private
        # Use callbacks to share common setup or constraints between actions.
        def set_order
          @order = current_user.orders.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def order_params
          params.require(:order).permit(:user_id, :name, :address)
        end
    
end
