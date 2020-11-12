class Item < ApplicationRecord
    belongs_to :user

    has_many :order_items
    has_many :orders, through: :order_items

    validates :name, :presence => true, :length => {:maximum => 50}
    validates :description, :presence => true, :length => {:maximum => 500}
    validates_presence_of :in_stock
    validates_numericality_of :price, :greater_than_zero => 0

    # validates :user_id, presence: true
end
