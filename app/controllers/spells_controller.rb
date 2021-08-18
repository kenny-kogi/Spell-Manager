class SpellsController < ApplicationController
  before_action :set_spell, only: [:show, :edit, :update, :destroy, :choose_book, :add_to_book]
  def index
    if !params[:spell]
      spells = Spell.all
      @spell = Spell.new(level: nil, concentration: nil)
    else
      if params[:concentration]
        spells = Spell.where(concentration: query_params[:concentration])
      else
        query_params[:concentration] = nil
      end
      if query_params[:level]
        spells ||= spells.or(Spell.where(level: query_params[:level]))
      else
        query_params[:level] = nil
      end
      spells ||= spells.or(Spell.where(school: query_params[:schools])) if params[:school]
      spells ||= spells.or(Spell.where(classes: query_params[:classes])) if params[:classes]
      @spell = Spell.new(query_params)
    end
    @spells = spells.order('level ASC')
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
      flash[:success] = "Successfully Edited #{@spell.name}"
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

  def add_to_book
    @spell = Spell.find params[:id]
    @books = Book.all
    @spell_book = SpellBook.new
  end

  private
  def spell_params
    params.require(:spell).permit(:name, :level, :school, :concentration, :description, classes: [])
  end

  def query_params
    params.require(:spell).permit(level: [], school: [], concentration: [], classes: [])
  end

  def set_spell
    @spell = Spell.find params[:id]
  end
end
