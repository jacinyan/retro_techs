class Order < ApplicationRecord
  belongs_to :user

  has_many :order_items, dependent: :destroy

  validates :name, presence: true
  validates :address, presence: true

end
