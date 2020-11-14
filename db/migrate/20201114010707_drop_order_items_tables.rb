class DropOrderItemsTables < ActiveRecord::Migration[6.0]
  def up
    drop_table :order_items
  end

  def down
    add_table :order_items
  end
end
