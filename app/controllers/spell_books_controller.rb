class SpellBooksController < ApplicationController
  def create
    @spell_book = SpellBook.new(spell_book_params)
    if @spell_book.save
      flash[:success] = "Successfully added #{@spell_book.spell.name} to #{@spell_book.book.name}"
      redirect_to spells_path
    else
      @books = Book.all
      render :new
    end
  end
  
  def new
    @books = Book.all
    @spell = params[:spell_id]
    @spell_book = SpellBook.new
    @spell_name = params[:spell_name]
  end

  def destroy
    @spell_book = SpellBook.where('spell_id = ?', params[:id])
    @spell_book.destroy_all
    flash[:success] = "Successfully deleted from #{@spell_book.name}"
    redirect_to spells_path
  end

  private
  def spell_book_params
    params.require(:spell_book).permit(:book_id, :spell_id, :spell_name)
  end
end
