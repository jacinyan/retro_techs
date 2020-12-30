module CartsHelper
    def render_cart_total(cart)
        cart.total
    end

    def cart_length(cart)
        cart.order_items.length
    end
end
