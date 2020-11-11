class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :orders, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def admin?
    role == "admin"
  end

  def seller?
    role == "seller"
  end

  def buyer?
    role == "buyer"
  end

  def guest?
    role == "guest"
  end

  # scope :seller, lambda { where(role: "seller") }
  # scope :buyer, lambda { where(role: "buyer") }


end

