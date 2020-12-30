class OrderItemsController < ApplicationController
    def create
        selected_item = Item.find(params[:item_id])
        current_cart 

        if current_cart.items.include?(selected_item)
            @order_item = current_cart.order_items.find_by(item_id: selected_item)
            @order_item.quantity += 1
        else
            @order_item = OrderItem.new
            @order_item.cart = current_cart
            @order_item.item = selected_item
        end
        @order_item.save
        flash[:notice] = 'Item was succefully added to cart.'
        redirect_to items_url
    end

    def destroy
        @order_item = OrderItem.find(params[:id])
        @order_item.destroy
        redirect_to cart_path(current_cart)
    end  

    private

        def order_item_params
            params.require(:order_item).permit(:quantity, :item_id, :cart_id)
        end

end
