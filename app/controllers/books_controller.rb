class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit]

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @book = Book.new
  end

  def create
    binding.pry
    @product = Product.find(params[:product_id])
    @book = @product.books.new(book_params)

    if @product.save
      redirect_to product_book_path(@product, @book), notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end


    def book_params
      params.require(:book).permit(:name,
                                   :comment,
                                   :product_id,
                                   reservations_attributes: [
                                       :id,
                                       :time,
                                       :product_id
                                   ])
    end

    def invalid_book
      logger.error "Attempt to access invalid book #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end
end
