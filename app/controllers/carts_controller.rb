class CartsController < ApplicationController
    def show
        # helper method defiend in application_controller
        current_cart
    end

    def empty
        # empty! method defiend in cart model cart.rb , which is feasible
        current_cart
        current_cart.empty!
        flash[:warning] = "Emptied"
        redirect_to root_path
    end

end
