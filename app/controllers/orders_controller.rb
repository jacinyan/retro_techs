class OrdersController < ApplicationController
    load_and_authorize_resource
    # before_action :set_order, only: [:show, :edit, :update, :destroy]

    # GET /orders
    # GET /orders.json
    def index
        # current_user.orders
    end

    def show
        # @order = current_user.orders.find(params[:id])
        # @order.user_id = current_user.id
    end

    # GET /orders/new
    def new
        # @order = current_user.orders.build
    end

    # GET /orders/1/edit
    def edit
    end

    def create
        # @order = order.new(order_params)
        # @order = current_user.orders.build(order_params)
        respond_to do |format|
        @order.user_id = current_user.id
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
        #   @order = current_user.orders.find(params[:id])
        end
    
        # Only allow a list of trusted parameters through.
        def order_params
          params.require(:order).permit({:item_ids => []})
        end
    
end
