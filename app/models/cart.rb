class Cart < ApplicationRecord
    has_many :order_items, dependent: :destroy
    has_many :items, through: :order_items, source: :item

    def empty!
        self.order_items.destroy_all
    end

    def total
        sum = 0
        order_items.each do |order_item|
            if order_item.item.price.present? && order_item.quantity.present?
                sum += order_item.item.price * order_item.quantity
            end
        end
        return sum
    end
    
end
