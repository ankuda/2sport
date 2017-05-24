class StoreController < ApplicationController

  def index
    @products = Product.includes(:cover, :category, :location).order(:title)
  end
end
