class ProductsController < ApplicationController
  before_action :set_product, only: :show
  before_action :set_categories

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end
end
