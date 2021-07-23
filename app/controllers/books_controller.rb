class BooksController < ApplicationController
  def index
      @books = Book.all
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = 'Book was successfully created.'
      redirect_to books_path
      return
    else
      flash.now[:messages] = @book.errors.full_messages
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find params[:id]
  end

  def show
   @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    if @book.update(book_params)
      flash[:success] = "Book was successfully updated"
      redirect_to books_path
      return
    else
      flash.now[:messages] = @book.errors.full_messages
      render :edit
    end
  end

  def delete
    @book = Book.find(params[:id])
  end

  def destroy
    @book = Book.find params[:id]
    @book.delete
    flash[:success] = "Book was successfully deleted"
    redirect_to books_path
  end

  private
    def book_params
        params.require(:book).permit(:name)
    end
end
