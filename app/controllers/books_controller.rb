class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.order_by params[:order_by]
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      flash[:success] = "Successfully created #{@book.name}"
      redirect_to books_path
    else
      render :new
    end
  end

  def new
    @book = Book.new
  end

  def show
  end

  def update
    @book = Book.find params[:id]
    if @book.update(book_params)
      flash[:success] = "Successfully updated #{@book.name}"
      redirect_to books_path
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    flash[:success] = "Successfully deleted #{@book.name}"
    redirect_to books_path
  end

  def add_spell
    @spell = Spell.all
    @book = Book.find params[:id]
    @spell_book = SpellBook.new
  end

  private
  def set_book
    @book = Book.find params[:id]
  end

  def book_params
    params.require(:book).permit(:name)
  end
end
