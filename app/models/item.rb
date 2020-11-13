class Item < ApplicationRecord
    has_many :order_items
    has_many :orders, through: :order_items

    has_one_attached :picture

    validates :name, :presence => true, :length => {:maximum => 50}
    validates :description, :presence => true, :length => {:maximum => 500}
    validates_presence_of :in_stock
    validates_numericality_of :price, :greater_than_zero => 0
end
