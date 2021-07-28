class SpellsController < ApplicationController
  before_action :set_spell, only: [:show, :edit, :update, :destroy, :choose_book, :add_to_book]
  def index
    @spells = Spell.all
  end

  def show
  end

  def create
    @spell = Spell.new(spell_params)
    if @spell.save
      flash[:success] = "Successfully created #{@spell.name}"
      redirect_to spells_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @spell.update(spell_params)
      flash[:success] = "Successfully updated #{@spell.name}"
      redirect_to spells_path
    else
      render :edit
    end
  end

  def new
    @spell = Spell.new
  end

  def destroy
    @spell.destroy
    flash[:success] = "Successfully deleted #{@spell.name}"
    redirect_to spells_path
  end
  
  # def choose_book
  #   @spell_book = SpellBook.new
  #   @books = Book.all
  # end

  # def add_to_book
  #   @books = Book.all
  #   @spell_book = @spell.spell_books.build(book_id: params[:spell_book][:book_id])
  #   if @spell_book.save
  #     flash[:success] = "Successfully updated #{@spell.name}"
  #     redirect_to spells_path
  #   else
  #     render :choose_book
  #   end
  # end

  private
  def spell_params
    params.require(:spell).permit(:name, :level, :school, :concentration, :description, classes: [])
  end

  def set_spell
    @spell = Spell.find params[:id]
  end
end
