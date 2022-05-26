class BooksController < ApplicationController
  def index
    @book =Book.new
    @books=Book.all
  end

  def create
    @book= Book.new(book_params)
    if @book.save
      redirect_to book_path(@book.id) ,notice: 'Book was successfully created.'
    else
      @books=Book.all
      render :index
    end


  end

  def show
    @books=Book.all
    @book=Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])
  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end

  def destroy
    book=Book.find(params[:id])
    book.destroy
    redirect_to '/books',notice: 'Book was successfully destroyed'
  end

  private

  def book_params
    params.require(:book).permit(:title,:body)
  end

end
