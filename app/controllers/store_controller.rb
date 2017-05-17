class StoreController < ApplicationController
  include CurrentBook
  before_action :set_book

  def index
    @products = Product.order(:title)
  end
end
