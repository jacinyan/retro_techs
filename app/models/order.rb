class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items

  # before_validation :set_total!

  validates :total, presence: true
  validates_numericality_of :total, :greater_than_zero => 0

  # private

  # validates :user_id, presence: true
end
