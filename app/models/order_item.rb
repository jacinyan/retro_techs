class OrderItem < ApplicationRecord
  belongs_to :order, inverse_of: :order_items
  belongs_to :item, inverse_of: :order_items
end
