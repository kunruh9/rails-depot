class AddPriceToLineItem < ActiveRecord::Migration[5.0]
  def up
    add_column :line_items, :price, :decimal, precision: 8, scale: 2

    LineItem.all.each do |item|
      item.price = item.product.price
      item.save!
    end
  end

  def down
    remove_column :line_items, :price
  end
end
