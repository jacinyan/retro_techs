class ChangePriceDefaultFromItems < ActiveRecord::Migration[6.0]
  def change
    change_column_default :items, :price, precision: 10, scale: 2, default: 0
  end
end
