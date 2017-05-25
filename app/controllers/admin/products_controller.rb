class Admin::ProductsController < ApplicationController
  layout 'admin'

  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_categories
  before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def show
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, @product], notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  def update
    if @product.update(product_params)
      redirect_to [:admin, @product], notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to admin_products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.all
  end

  def product_params
    params.require(:product).permit(:title, :description, :price, :start_working, :end_working, :category_id,
                                    :width, :length, :height,
                                    location_attributes: [
                                        :id,
                                        :address,
                                        country_attributes: [
                                            :id,
                                            :title
                                        ],
                                        city_attributes: [
                                            :id,
                                            :title
                                        ]
                                    ],
                                    cover_attributes: [
                                        :id,
                                        :ctype
                                    ],
                                    building_attributes: [
                                        :id,
                                        :btype
                                    ])
  end
end
