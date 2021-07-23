class SpellBooksController < ApplicationController

    def index
        @spell_books = SpellBook.all
    end
 
    def delete
        @spell_books = SpellBook.find params[:spells_id]
    end

    def destroy
        @spell_books = SpellBook.find params[:spells_id]
        @spell_books.delete
        flash[:success] = "Spell was successfully removed"
        redirect_to books_path    
    end

    def create
        @spell_books = SpellBook.new(spells_id: params[:spells_id], books_id: params[:book_id])
        if @spell_books.save
           flash[:success] = "Added to the Spell Book"
           redirect_to spells_path  
        else
            flash.now[:notice] = "Failed to save the Spell"
            render :new       
        end
    end
end
