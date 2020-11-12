class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  validates :total, presence: true
  validates_numericality_of :total, :greater_than_zero => 0
end
