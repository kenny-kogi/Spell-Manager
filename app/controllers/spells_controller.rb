class SpellsController < ApplicationController
  def index
    @spells = Spell.all
  end

  def show
    @spells = Spell.find params[:id]
    @books = Book.all.map{ |u| [ u.name, u.id ] }
  end

  def create
    @spells = Spell.new(spell_params)
    if @spells.save
      flash[:success] = "Spell successfully created"
      redirect_to spells_path
      return
    else
      flash.now[:messages] = @spells.errors.full_messages
      render :new
    end
  end

  def edit
    @spells = Spell.find params[:id]
  end

  def update
    @spells = Spell.find params[:id]
    if @spells.update(spell_params)
      flash[:success] = "Spell successfully Updated"
      redirect_to spells_path
    else
      flash.now[:messages] = @spells.errors.full_messages
      render :edit
    end
  end

  def new
    @spells = Spell.new
  end
  
  def destroy
    @spells = Spell.find params[:id]
    @spells.delete
    redirect_to spells_path
    flash[:success] = "Spell successfully Deleted"
  end

  def delete
    @spells = Spell.find [:id]
  end

  private
    def spell_params
      params.require(:spell).permit(:name, :level, :school, :classes, :concentration, :description)
    end
end
