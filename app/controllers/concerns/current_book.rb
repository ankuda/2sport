module CurrentBook
  private

    def set_book
      @book = Book.find(session[:book_id])

    rescue ActiveRecord::RecordNotFound
      @book = Book.create
      session[:book_id] = @book.id
    end
end