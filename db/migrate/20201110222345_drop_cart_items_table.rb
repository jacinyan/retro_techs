class DropCartItemsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :cart_items
  end

  def down
    add_table :cart_items
  end

end
