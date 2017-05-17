class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :book

  def total_price
    product.price * quantity
  end
end
