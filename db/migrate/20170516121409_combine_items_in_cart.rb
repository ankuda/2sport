class CombineItemsInCart < ActiveRecord::Migration[5.0]
  def change
  end

  def up
    Book.all.each do |book|
      sums = book.line_items.group(:prodcut_id).sum(:quantity)

      sums.each do |prodcut_id, quantity|
        if quantity > 1
          cart.line_items.where(prodcut_id: prodcut_id).delete_all

          item = cart.line_items.build(prodcut_id: prodcut_id)
          item.quantity = quantity
          item.save!
        end
      end
    end
  end

  def down
    LineItem.where("quantity>1").each do |line_item|
      #add individual items
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          prodcut_id: line_item.prodcut_id,
          quantity: 1
        )
      end

      #remove original item
      line_item.destroy
    end
  end
end
