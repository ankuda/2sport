class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :invalid_book

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @product = Product.find(params[:product_id])
    @book = @product.books.new
  end

  def edit
  end

  def create
    binding.pry
    @book = Book.new(book_params)
    if @book.save
      redirect_to @book, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  private

    def set_book
      @book = Book.find(params[:id])
    end


    def book_params
      params.require(:book).permit(:product_id)
    end

    def invalid_book
      logger.error "Attempt to access invalid book #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    end
end
