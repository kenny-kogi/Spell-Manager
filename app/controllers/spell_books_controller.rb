class SpellBooksController < ApplicationController
  def create
    @spell_book = SpellBook.new(spell_book_params)
    if @spell_book.save
      flash[:success] = "Successfully added #{@spell_book.spell.name} to #{@spell_book.book.name}"
    else
      flash[:error] = @spell_book.errors.full_messages.join(", ")
    end
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @spell_book = SpellBook.find_by(spell_id: params[:id])
    @spell_book.destroy
    flash[:success] = "Successfully deleted #{@spell_book.spell.name}"
    redirect_to @spell_book.book
  end

  private
  def spell_book_params
    params.require(:spell_book).permit(:book_id, :spell_id, :spell_name)
  end
end
