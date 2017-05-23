class StoreController < ApplicationController

  def index
    @products = Product.includes(:cover, :category).order(:title)
  end
end
