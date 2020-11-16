class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :nullify

  validates :name, presence: true
  validates :address, presence: true

  def total
    sum = 0
    order_items.each do |listed_item|
        if listed_item.item.price.present? && listed_item.quantity.present?
            sum += listed_item.item.price * listed_item.quantity
        end
    end
    return sum
  end

end
