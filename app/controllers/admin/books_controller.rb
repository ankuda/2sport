class Admin::BooksController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!

  def index
    @products = Product.all.includes(:reservations, :books, :location)
  end
end
