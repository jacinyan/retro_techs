class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.string :in_stock
      t.decimal :price, precision: 10, scale: 2, default: 0
      t.text :description

      t.timestamps
    end
  end
end
