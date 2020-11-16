class Item < ApplicationRecord
    has_many :order_items, dependent: :destroy

    has_one_attached :picture

    #latest kv pair format doesnt work for this, not sure why
    validates :name, :presence => true, :length => {:maximum => 50}
    validates :description, :presence => true, :length => {:maximum => 500}
    validates_presence_of :in_stock
    validates_numericality_of :price, :greater_than_zero => 0

end
