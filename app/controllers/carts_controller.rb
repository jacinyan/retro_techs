class CartsController < ApplicationController
    def show
        current_cart
    end

    def empty
        current_cart
        # calling method defined in model
        current_cart.empty!
        respond_to do |format|
            format.html { redirect_to cart_url, notice: 'Cart was successfully emptied.' }
            format.json { head :no_content }
          end
    end

end


   
