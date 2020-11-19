class CartsController < ApplicationController
    def show
        current_cart
    end

    def empty
        current_cart
        # calling method defined in model
        current_cart.empty!
        flash[:warning] = "Emptied"
        redirect_to items_path
    end

end
