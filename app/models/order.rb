class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :nullify

  validates :name, presence: true
  validates :address, presence: true

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
