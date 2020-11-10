class DropShoppingCartsTable < ActiveRecord::Migration[6.0]
  def up
    drop_table :shopping_carts
  end

  def down
    add_table :shopping_carts
  end

end
