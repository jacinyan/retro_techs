class CartsController < ApplicationController
    def show
        current_cart
    end

    def empty
        current_cart
        current_cart.empty!
        flash[:warning] = "Emptied"
        redirect_to items_path
    end

end
