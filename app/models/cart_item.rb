class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :shopping_cart

  def sum_total
    item.price.to_i * quantity.to_i
  end
end
