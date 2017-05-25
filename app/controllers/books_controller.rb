class BooksController < ApplicationController

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @book = Book.new
  end

  def create
    @product = Product.find(params[:product_id])
    @book = @product.books.new(book_params)

    if @book.save
      Mailer.book_confirmation(@book).deliver
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
                                   :email,
                                   :comment,
                                   :product_id,
                                   reservations_attributes: [
                                       :id,
                                       :time,
                                       :product_id
                                   ])
    end

    def filter_params
      params[:book][:reservations_attributes].each do |k, v|
        params[:book][:reservations_attributes].delete(k) if v[:time].nil?
      end
    end

    def invalid_book
      logger.error "Attempt to access invalid book #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end
end
